import 'package:flutter/material.dart';
import 'package:passgen/screen/homescreen.dart';
import 'package:passgen/screen/passgenscreen.dart';
import 'package:passgen/screen/profilescreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    bool showFAB = MediaQuery.of(context).viewInsets.bottom != 0;
    List<Widget> widgetList = const [HomeScreen(), ProfileScreen()];

    return Scaffold(
      // backgroundColor: ,
      body: widgetList[_selectedButton],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !showFAB,
        child: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PassGenScreen()));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.deepPurpleAccent,
          child: const Icon(
            Icons.add_circle_outline_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 229, 215, 255),
            onTap: (value) {
              setState(() {
                _selectedButton = value;
              });
            },
            currentIndex: _selectedButton,
            iconSize: 35,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
