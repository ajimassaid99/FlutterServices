import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Dashboard_controller.dart';

class ProfileWidget extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3'),
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                controller.User[0]['email'],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(controller.User[0]['no_telp']),
                  onTap: () {
                    // Add functionality here
                  },
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('New York, USA'),
                  onTap: () {
                    // Add functionality here
                  },
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('January 1, 1990'),
                  onTap: () {
                    // Add functionality here
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}