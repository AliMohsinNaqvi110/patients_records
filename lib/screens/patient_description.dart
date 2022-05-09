import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Name: ",
            style: TextStyle(
              fontFamily: "LibreBaskerville",
              fontWeight: FontWeight.bold
            ),),
            Text("Date Of Birth: ",
              style: TextStyle(
                  fontFamily: "LibreBaskerville",
                  fontWeight: FontWeight.bold
              ),),
            Text("Contact: ",
              style: TextStyle(
                  fontFamily: "LibreBaskerville",
                  fontWeight: FontWeight.bold
              ),),
            Text("Address: ",
              style: TextStyle(
                  fontFamily: "LibreBaskerville",
                  fontWeight: FontWeight.bold
              ),),
            Text("Details: ",
              style: TextStyle(
                  fontFamily: "LibreBaskerville",
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
      ),
    );
  }
}
