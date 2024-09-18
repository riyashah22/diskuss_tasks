import 'package:diskuss_task/screens/Subscription/main_subscription.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Add this package in pubspec.yaml
import 'package:share_plus/share_plus.dart'; // Add this package for sharing

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _shareDigitalCard() {
    final String contactDetails = """
    DISKUSS
    Designer

    Contact Details:
    Email: Kiran27@gmail.com

    Feel free to ask any questions or get in touch for more information.
    """;

    Share.share(contactDetails, subject: 'Share Your Digital Business Card');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),

              // Flip Business Card
              Container(
                  width: double.infinity, child: _buildFlipBusinessCard()),

              SizedBox(height: 16),

              // Manage & Share Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton("Manage Card", Icons.credit_card),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[50],
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    icon: Icon(Icons.share),
                    label: Text("Share Digital"),
                    onPressed: _shareDigitalCard,
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Create New Business Card
              _buildCreateNewCardSection(),

              SizedBox(height: 20),

              // Categories
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              _buildCategories(),

              SizedBox(height: 20),

              // Remainders Section
              Text(
                "Remainders",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              // Use a ListView for the remainders section and wrap it with a container to give it a fixed height
              ListView.builder(
                shrinkWrap:
                    true, // Important to ensure it works within the scrollable area
                physics:
                    NeverScrollableScrollPhysics(), // Prevents inner scrolling conflict
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text("Kiran"),
                    subtitle: Text("levon techno - 10:30 am"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlipBusinessCard() {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // Flip direction
      front: _buildBusinessCardFront(),
      back: _buildBusinessCardBack(),
    );
  }

  Widget _buildBusinessCardFront() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.blue[900]!],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("DISKUSS", style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 8),
          Text("Designer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Personal Card",
              style: TextStyle(color: Colors.white54, fontSize: 16)),
          SizedBox(height: 16),
          Text("Contact", style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("Kiran27@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildBusinessCardBack() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.blue[900]!],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("DISKUSS", style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 8),
          Text("Developer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Company Info",
              style: TextStyle(color: Colors.white54, fontSize: 16)),
          SizedBox(height: 16),
          Text("Contact", style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("developer@diskuss.com",
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildButton(String text, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[50],
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(icon),
      label: Text(text),
      onPressed: () {},
    );
  }

  Widget _buildCreateNewCardSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Create New Digital\nBusiness Card",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionScreen()),
                );
              },
              icon: Icon(Icons.add, color: Colors.white, size: 32)),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryItem("Themes", Icons.image, Colors.blue[100]!),
        _buildCategoryItem("Meetings", Icons.videocam, Colors.black),
        _buildCategoryItem("Contacts", Icons.contact_phone, Colors.black),
        _buildCategoryItem("Refer", Icons.person_add, Colors.black),
      ],
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
