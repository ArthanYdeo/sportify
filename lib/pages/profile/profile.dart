import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String username = 'DreamybullzXXX';
  final String fullName = 'Perrell Laquarius Brown';
  final String bio = 'Self pleasure is not Gay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 71, 77, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Icon(
                Icons.person,
                size: 120,
                color: Color.fromRGBO(4, 71, 77, 1),
              ),
            ),
            SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              fullName,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              bio,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 33, 53,
                        70)), // Change the color to your preferred color
              ),
              //reminder to put logic next coding session
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
