import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meeting Details',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow for a smoother gradient effect
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Set back arrow color to white
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue[900]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Meeting Title
            const Text(
              'Meeting Title: Project Kickoff',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Date
            const Text(
              'Date: September 25, 2024',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),

            // Time
            const Text(
              'Time: 10:00 AM - 11:00 AM',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),

            // Participants
            const Text(
              'Participants:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '• Alice Johnson\n'
              '• Bob Smith\n'
              '• Carol Williams',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'This meeting will cover the initial planning and project scope for the upcoming quarter. '
              'We will discuss the project goals, milestones, and team responsibilities.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
