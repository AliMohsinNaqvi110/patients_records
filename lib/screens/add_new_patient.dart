import 'package:flutter/material.dart';
import 'package:patients_records/constants/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:patients_records/constants/widgets/custom_button.dart';
import 'package:patients_records/services/firestore_db.dart';

class AddPatients extends StatefulWidget {
  const AddPatients({Key? key}) : super(key: key);

  @override
  State<AddPatients> createState() => _AddPatientsState();
}

class _AddPatientsState extends State<AddPatients> {

  String name = "";
  late DateTime dateOfBirth;
  String address = "";
  String mobileNumber = "";
  String details = "";
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

  // Text editing controllers
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController dobTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController mobileNumberTextController = TextEditingController();
  final TextEditingController detailsTextController = TextEditingController();

  // State Function
  clearForm() {
    nameTextController.clear();
    dobTextController.clear();
    addressTextController.clear();
    mobileNumberTextController.clear();
    detailsTextController.clear();
  }


  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
    dobTextController.dispose();
    addressTextController.dispose();
    mobileNumberTextController.dispose();
    detailsTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Patients"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: nameTextController,
                          decoration: textInputDecoration.copyWith(
                            label: const Text("Name"),
                            hintText: "Patient Name..",
                          ),
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          validator: (val) {
                            if(val == "") {
                              return "Please enter a patients name";
                            }
                            else {
                             return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: DateTimeField(
                          controller: dobTextController,
                          decoration: textInputDecoration.copyWith(
                              hintText: "Date of Birth"),
                          resetIcon: const Icon(Icons.cancel_sharp),
                          onChanged: (val) {
                            setState(() => dateOfBirth = val!);
                          },
                          format: format,
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            return date;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: addressTextController,
                            decoration: textInputDecoration.copyWith(
                              label: const Text("Address"),
                              hintText: "Address..",
                            ),
                          onChanged: (val) {
                            setState(() {
                              address = val;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: mobileNumberTextController,
                          keyboardType: TextInputType.number,
                            decoration: textInputDecoration.copyWith(
                              label: const Text("Mobile Number"),
                              hintText: "Mobile Number..",
                            ),
                          onChanged: (val) {
                            setState(() {
                              mobileNumber = val;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          controller: detailsTextController,
                          minLines: 3,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: textInputDecoration.copyWith(
                              hintText: "Patient details..",
                            ),
                          onChanged: (val) {
                            setState(() {
                              details = val;
                            });
                          },
                        ),
                      ),
                     Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  child: const CustomButton(text: Text("Add Patient"), color: Colors.cyan),
                              onTap: () {
                                    if(_formKey.currentState!.validate()){
                                      DatabaseService().addNewPatient(name: name, dateOfBirth: dateOfBirth, address: address, mobileNumber: mobileNumber, details: details);
                                      clearForm();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Patient added"),
                                    ));
                                    }},
                              ),
                              GestureDetector(
                                  onTap: () {
                                    clearForm();
                                    },
                                  child: const CustomButton(text: Text("Clear form"), color: Colors.redAccent)),
                            ],
                          ),
                        ),
                    ],
            ),
                ))
          ],
        ),
      ),
    );
  }
}
