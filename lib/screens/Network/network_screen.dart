import 'package:flutter/material.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Network',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
            onPressed: () {
              // Action to add new connection
            },
          )
        ],
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow for a smoother gradient effect

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
          children: [
            _buildSummarySection(),
            const SizedBox(height: 20),
            _buildConnectionsList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Connections'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Invitations'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSummaryCard('Connections', '120'),
        _buildSummaryCard('Pending', '8'),
        _buildSummaryCard('Suggestions', '15'),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String count) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              count,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Placeholder image
            ),
            title: Text('Connection Name $index'),
            subtitle: Text('Location, Mutual Interests'),
            trailing: IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Message action
              },
            ),
          );
        },
      ),
    );
  }
}
