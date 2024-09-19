import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ReferAndEarnScreen(),
  ));
}

class ReferAndEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40), // To simulate top status bar padding
            // Main Refer and Earn Card
            GestureDetector(
              child: Image.asset("assets/image.png"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid, // Solid border for each dash
                  ),
                  borderRadius: BorderRadius.circular(10),
                  // Creating the dashed effect
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DISKUSS2024",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Handle the copy action
                      },
                      child: Icon(Icons.copy, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "How it works!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: buildHowItWorksStep(
                    Icons.send,
                    "Invite your friends\nAnd Families",
                    "Share the link with your Friends & other social platform.",
                  ),
                ),
                Expanded(
                  child: buildHowItWorksStep(
                    Icons.person_add_alt_1,
                    "Get ₹50 when Signup",
                    "When your friend sign up on the app, you will receive ₹50.",
                  ),
                ),
                Expanded(
                  child: buildHowItWorksStep(
                    Icons.card_membership,
                    "Get ₹50 when card is created.",
                    "When your friend sign up on the app, you will receive ₹50.",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            Text("See All FAQs"),
            // Invite Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Add invite functionality
                    },
                    icon: Icon(Icons.send),
                    label: Text("Invite"),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Add invite via WhatsApp functionality
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Image.asset(
                      'assets/whatsapp.png', // Add your WhatsApp logo asset here
                      height: 30, // Adjust size as needed
                      width: 30,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper function to build each step in "How it works" section
  Column buildHowItWorksStep(IconData icon, String title, String description) {
    return Column(
      children: [
        Icon(icon, size: 25, color: Colors.blue),
        SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
        Container(
          width: 100,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
