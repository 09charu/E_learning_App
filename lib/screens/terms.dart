import 'package:flutter/material.dart';

void main() {
  runApp(TermsPage());
}

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCAC19A),
          title: Text('Terms and Conditions',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),),
        ),
        body: TermsAndConditionsScreen(),
      ),
    );
  }
}

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '1. Introduction',
              style: TextStyle(
                fontSize: 18,

              ),
            ),
            Text(
              'Welcome to Your E-Learning App. By accessing or using our services, you agree to comply with and be bound by these terms and conditions.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '2. Use of Services',
              style: TextStyle(
                fontSize: 18,

              ),
            ),
            Text(
              'You may use our services for personal and educational purposes. You must not use our services for any illegal or unauthorized purpose.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '3. Privacy Policy',
              style: TextStyle(
                fontSize: 18,

              ),
            ),
            Text(
              'Please review our Privacy Policy to understand how we collect, use, and protect your personal information.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50.0),
            // Include more sections for your specific terms and conditions.
            // You can add additional sections by following the same format.
            Center(
              child: Container(
                child: Image.asset(
                  'images/lock.gif',
                  height: 200,
                  width: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
