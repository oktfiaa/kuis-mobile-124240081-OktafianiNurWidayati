import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240081/views/home.dart';
import 'package:kuis_mobile_124240081/views/profile.dart';


class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  //indeks aktif untuk BottomNavigationBar(0:Home, 1:Profile)
  int selectedIndex = 0;

  final List<String> titles = ["Home", "Profile"];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(), ProfilePage()];

    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex])),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 105, 140, 253),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}