import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference patientsCollection = FirebaseFirestore.instance.collection("patients");

  Future addNewPatient(
      {
        required String name,
        required DateTime dateOfBirth,
        required String address,
        required String mobileNumber,
        required String details
      }
      ) async {
    try {
      await patientsCollection.add({
        "Name" : name,
        "DateOfBirth" : dateOfBirth,
        "Address" : address,
        "MobileNumber" : mobileNumber,
        "Details" : details
      });
    }
    catch(e) {
      log(e.toString());
    }
  }
}