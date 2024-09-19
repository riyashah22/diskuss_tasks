import 'package:diskuss_task/screens/Categories/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:diskuss_task/screens/Analytics/analytics.dart';
import 'package:diskuss_task/screens/Home/home_page.dart';
import 'package:diskuss_task/screens/Settings/settings_screen.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Extends body behind the bottom app bar
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.black.withOpacity(.9),
      //   title: Text('Diskuss', style: TextStyle(color: Colors.white)),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.notifications, color: Colors.white),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Center(child: HomeScreen()),
          Center(
            child: ContactScreen(),
          ),
          Center(
            child: AnalyticsScrren(),
          ),
          Center(
            child: SettingsScreen(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70, // Adjust height as needed
        width: 70, // Adjust width as needed
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xff0061ff),
              Color(0xff60efff)
            ], // Define your gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleBarcodeScannerPage(),
                ));
          },
          backgroundColor: Colors
              .transparent, // Set background color to transparent to see the gradient
          elevation: 0, // Optional: remove shadow
          child: const Icon(
            size: 40,
            Icons.document_scanner_outlined,
            color: Colors.white,
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.black, // Set the bottom app bar color here
        elevation: 0, // Remove shadow
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          height: kBottomNavigationBarHeight, // Ensure the height is proper
          decoration: BoxDecoration(
            color:
                Colors.black, // Set the same background color as the bottom bar
          ),
          child: BottomNavigationBar(
            iconSize: 16, // Adjusted icon size for better visuals
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white, // Adjust selected color
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black, // No additional color
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Network',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label: 'Analytics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
