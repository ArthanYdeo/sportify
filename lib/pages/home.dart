import 'package:flutter/material.dart';
import 'package:sportify/constant/colors.dart';
import 'package:sportify/pages/friendrequest/FriendRequest.dart';
import 'package:sportify/pages/message/message.dart';
import 'package:sportify/pages/polls/polls.dart';
import 'package:sportify/pages/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    Polls(),
    FriendRequests(),
    Messages(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      backgroundColor: Color.fromRGBO(4, 71, 77, 1),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Newsfeed',
            backgroundColor: Color.fromARGB(255, 10, 32, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Polls',
            backgroundColor: Color.fromARGB(255, 10, 32, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
            backgroundColor: Color.fromARGB(255, 10, 32, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
            backgroundColor: Color.fromARGB(255, 10, 32, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 10, 32, 49),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.secondary,
      body: Center(
        child: Text(
          'Newsfeed!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
