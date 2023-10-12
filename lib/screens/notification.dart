import 'package:flutter/material.dart';

void main() {
  runApp(NotificationScreen());
}

class NotificationItem {
  final String title;
  final String message;

  NotificationItem({required this.title, required this.message});
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> notifications = [
    NotificationItem(title: 'Notification 1', message: 'Message 1'),
    NotificationItem(title: 'Notification 2', message: 'Message 2'),
    NotificationItem(title: 'Notification 3', message: 'Message 3'),
    // Add more notifications as needed
  ];

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAC19A),
        title: Text('Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
      ),
      body: Container(
        color: Color(0xFFFFFBF3),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.message),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteNotification(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
