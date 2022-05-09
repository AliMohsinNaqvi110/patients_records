import 'package:flutter/material.dart';
import 'package:patients_records/screens/add_new_patient.dart';
import 'package:patients_records/screens/patient_description.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const AddPatients();
              }));
            },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.person_add_alt_1_rounded),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (val) {},
              decoration: InputDecoration(
                  hintText: "Search Patient ID..",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                      onTap: () {
                      },
                      child: const Icon(Icons.clear)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Profile();
                    }));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  title: const Text("Sara spencer"),
                  leading: const Icon(Icons.person),
                  tileColor: Colors.cyan[50],
                ),
                const SizedBox(height: 10,),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  title: const Text("Agmes Meyz"),
                  leading: const Icon(Icons.person),
                  tileColor: Colors.blueGrey[50],
                ),
                const SizedBox(height: 10,),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  title: const Text("Lonni Finch"),
                  leading: const Icon(Icons.person),
                  tileColor: Colors.cyan[50],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
