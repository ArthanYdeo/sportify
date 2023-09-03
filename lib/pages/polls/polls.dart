import 'package:flutter/material.dart';

class Polls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 32, 49),
      body: ListView(
        children: [
          PollItem(
            question: 'Which is your favorite sport?',
            options: ['Football', 'Basketball', 'Tennis', 'Soccer'],
          ),
        ],
      ),
    );
  }
}

class PollItem extends StatefulWidget {
  final String question;
  final List<String> options;

  PollItem({required this.question, required this.options});

  @override
  _PollItemState createState() => _PollItemState();
}

class _PollItemState extends State<PollItem> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              widget.question,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: widget.options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              return ListTile(
                title: Text(option),
                leading: Radio<int>(
                  value: index,
                  groupValue: selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
