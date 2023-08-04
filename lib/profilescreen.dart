import 'package:flutter/material.dart';
import 'package:hello/editprofilescreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/my.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Saurav Parajuli',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Email: Sauravparajuli2426@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to edit profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 16),
            Text(
              'Order History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Order #12345'),
              subtitle: Text('Total: \$100.00'),
              trailing: Text('Delivered'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Order #67890'),
              subtitle: Text('Total: \$50.00'),
              trailing: Text('In Progress'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logout logic
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
