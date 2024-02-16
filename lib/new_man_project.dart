// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/fav_view.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/home_view.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/profile_view.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/search_item_view.dart';

@RoutePage()
class NewManProject extends StatefulWidget {
  const NewManProject({super.key});

  @override
  State<NewManProject> createState() => _NewManProjectState();
}

class _NewManProjectState extends State<NewManProject> {
  final PageController pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.grey[800],
        child: BottomNavigationBar(
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "profile",
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          HomeView(),
          SearchItemView(),
          FavouritesView(),
          ProfileView()
        ],
      ),
    );
  }
}
