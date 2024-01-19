import 'package:flutter/material.dart';
import 'package:pixelforce/components/search_bar.dart';
import 'package:pixelforce/components/section_header.dart';
import 'package:pixelforce/components/thumbnail_loader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          minimum: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Search bar.
                const CustomSearchBar(
                  leadingIcon: Icon(Icons.search, color: Colors.black),
                  trailingIcon: Icon(
                    Icons.filter_list_outlined,
                    color: Colors.black,
                  ),
                ),
                // Content.
                SectionHeader(
                  key: const ValueKey('next_trip_section'),
                  title: 'Find your next trip',
                  buttonText: 'See all',
                  onTap: () {
                    print('See all');
                  },
                ),
                const ThumbnailsLoader(
                  url:
                      'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/trips.json',
                ),
                const SectionHeader(
                  key: ValueKey('living_style_section'),
                  title: 'Explore by living style',
                ),
                const ThumbnailsLoader(
                  url:
                      'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/living-style.json',
                ),
                const SectionHeader(
                  key: ValueKey('experiences_section'),
                  title: 'Want to discover other experiences',
                ),
                const ThumbnailsLoader(
                  url:
                      'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/other-experiences.json',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: Colors.deepPurpleAccent),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore),
              activeIcon: Icon(
                Icons.travel_explore,
                color: Colors.deepPurpleAccent,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(
                Icons.chat_bubble_outlined,
                color: Colors.deepPurpleAccent,
              ),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
}
