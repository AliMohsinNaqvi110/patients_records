import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patients_records/screens/add_new_patient.dart';
import 'package:patients_records/screens/patient_description.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? key;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddPatients();
                  }));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.person_add_alt_1_rounded),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _searchTextController,
                  onChanged: (val) {
                    setState(() => key = val);
                  },
                  decoration: InputDecoration(
                      hintText: "Search Patient ID..",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _searchTextController.clear();
                            setState(() => key = "");
                          },
                          child: const Icon(Icons.clear)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: (key != null)
                      ? FirebaseFirestore.instance
                          .collection('patients')
                          .where('Name',
                              isGreaterThanOrEqualTo: key,
                              isLessThan: key! + 'z')
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection("patients")
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            DocumentSnapshot _items =
                                snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: ListTile(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const Profile();
                                    }));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  title: Text(_items["Name"]),
                                  leading: const Icon(Icons.person),
                                  tileColor: Colors.blue[50]),
                            );
                          }
                        },
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
