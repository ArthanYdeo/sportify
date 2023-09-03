import 'package:flutter/material.dart';

class FriendRequests extends StatefulWidget {
  @override
  _FriendRequestsState createState() => _FriendRequestsState();
}

class _FriendRequestsState extends State<FriendRequests> {
  final List<String> friendRequests = [
    'azi acosta',
    'angeli khang',
    'juan kasalanan',
    'dreamy bullz',
    'piper perri',
    'mang kanor',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 71, 77, 1),
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 5, 26, 42), // Box background color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ), // Rounded corners only at the bottom
            ),
            child: Column(
              children: [
                Text(
                  'Friend Requests',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
                SizedBox(height: 30.0), // Spacing
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    labelText: 'find new Friends',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white, // Search bar background color
                    filled: true,
                  ),
                ),
              ],
            ),
          ),

          // Friend Requests List
          Expanded(
            child: ListView.builder(
              itemCount: friendRequests.length,
              itemBuilder: (context, index) {
                final userName = friendRequests[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Box background color
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ListTile(
                    title: Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // For future reference
                        // Implement the logic to add the user as a friend here
                        // You can show a confirmation dialog or perform any other action
                        // when the "Add Friend" button is pressed.
                      },
                      child: Text('Add Friend'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
