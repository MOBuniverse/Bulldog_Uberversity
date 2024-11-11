import 'package:bulldog_uberversity/components/my_drawer_tile.dart';
import 'package:bulldog_uberversity/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';


class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

@override
  Widget build(BuildContext context) {
   return Drawer(
    backgroundColor: Theme.of(context).colorScheme.surface,
    child: Column(
      children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            ),

          // home list title 
          MyDrawerTile(text: "H O M E", 
          icon: Icons.home, 
          onTap: () => Navigator.pop(context),
          ),
  

          //settings list title
          MyDrawerTile(text: "S E T T I N G S", 
          icon: Icons.settings, 
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),

          const Spacer(),

          //logout list title
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: MyDrawerTile(text: "L O G O U T", 
            icon: Icons.logout, 
            onTap: () {
              logout();
              Navigator.pop(context);
            },
            ),
          ),

        ],
      ),
    ); 
  }
}