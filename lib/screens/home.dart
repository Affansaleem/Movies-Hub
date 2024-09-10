import 'package:flutter/material.dart';
import 'package:movie_app/screens/pages/home_page.dart';
import 'package:movie_app/screens/pages/movies_page.dart';

class HomeScreen extends StatefulWidget {
  final Function toggleTheme;

  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  late int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          Switch(
            activeColor: Colors.deepPurple,
            inactiveThumbColor: Colors.white,
            value: isDarkMode,
            onChanged: (value) {
              widget.toggleTheme();
            },
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: const [
          Center(child: HomePage()),
          Center(child: MoviesPage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        selectedItemColor: isDarkMode ? Colors.white : Colors.black,
        unselectedItemColor: Colors.blueGrey,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined), label: "Movies"),
        ],
      ),
    );
  }
}
