import 'package:bulldog_uberversity/components/my_current_location.dart';
import 'package:bulldog_uberversity/components/my_description_box.dart';
import 'package:bulldog_uberversity/components/my_food_tile.dart';
import 'package:bulldog_uberversity/components/my_sliver_app_bar.dart';
import 'package:bulldog_uberversity/components/my_tab_bar.dart';
import 'package:bulldog_uberversity/models/food.dart';
import 'package:bulldog_uberversity/models/restaurant.dart';
import 'package:bulldog_uberversity/screens/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  // Tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){

      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount:categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food item
          final food =categoryMenu[index];

          //return food tile UI
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => FoodDetailScreen(food: food),
                ),
              ),
            );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(indent: 25,endIndent: 25, color: Theme.of(context).colorScheme.onSecondary,),


                // current location
                  MyCurrentLocation(),

                //description box
                const MyDescriptionBox(),
                ],
              ),
            ),
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
             controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu), 
            ),
        ),
      ),
    );
  }
}