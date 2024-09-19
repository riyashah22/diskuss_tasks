import 'package:diskuss_task/screens/Subscription/free_trail.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _currentPage = 0;

  final List<Map<String, dynamic>> _plans = [
    {
      'title': 'Silver',
      'price': '₹ 99/mo',
      'description': '7 Days Free Trial, Then ₹ 99/month',
      'features': [
        '10 Free Template',
        'Access to live meetings',
        'No Ads',
        'Cancel Anytime'
      ]
    },
    {
      'title': 'Gold',
      'price': '₹ 199/mo',
      'description': '7 Days Free Trial, Then ₹ 199/month',
      'features': [
        '50 Free Templates',
        'Priority Access to live meetings',
        'No Ads',
        'Cancel Anytime'
      ]
    },
    {
      'title': 'Diamond',
      'price': '₹ 299/mo',
      'description': '7 Days Free Trial, Then ₹ 299/month',
      'features': [
        'Unlimited Templates',
        'Priority Support for live meetings',
        'No Ads',
        'Cancel Anytime'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Container for the free trial and back arrow

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              color: Color(0xff003566),
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Add padding for a square look
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context); // Action for back navigation
                          },
                          child: Image.asset(
                            "assets/left-arrow.png",
                            height: 40,
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Your 7 Days ',
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Free Trials',
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Positioned card overlapping the container
          Positioned(
            top: 200, // Adjust to overlap with the container
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    itemCount: _plans.length,
                    controller: PageController(viewportFraction: 0.9),
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final plan = _plans[index];
                      return _buildSubscriptionCard(plan);
                    },
                  ),
                ),
                SizedBox(height: 16),
                Expanded(child: _buildPageIndicator()),
                Expanded(child: _buildTermsAndConditions()),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(Map<String, dynamic> plan) {
    return Transform.scale(
      scale: 0.95,
      child: Card(
        color: Color(0xffffeedd),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      plan['title'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      plan['price'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                plan['description'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(plan['features'].length, (index) {
                  return _buildFeatureItem(plan['features'][index]);
                }),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FreeTrialScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Color(0xff003566),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Text(
            feature,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_plans.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Color(0xff003566) : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildTermsAndConditions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Text(
            "Terms & Conditions",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff003566),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Euismod non nisl magna nullam nisi nisi pharetra eu facilisis. Odio laoreet turpis quis tempor fringilla. Accumsan.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
