import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240081/models/data.dart';
import 'package:kuis_mobile_124240081/views/login.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 10),
            Text(
              "Username",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            SizedBox(height: 4),
            Text(
              account.username, 
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
            onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
              );
          },
            icon: Icon(Icons.logout, size: 18, color: const Color.fromARGB(255, 220, 86, 240)),
              label: Text(
                "Logout",
                style: TextStyle(color: const Color.fromARGB(255, 220, 86, 240)),
              ),
          ),
          ],
        ),
      ),
    );
  }
}
