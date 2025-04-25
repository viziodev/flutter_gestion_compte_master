import 'package:flutter/material.dart';
import 'package:flutter_gestion_student/utils/constants.dart';
import 'package:flutter_gestion_student/views/screens/compte_form.dart';
import 'package:flutter_gestion_student/views/screens/comptes_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                       Navigator.pop(context);
                       Navigator.pushNamed(context, "/");
              },
            ),
             const Divider(),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List des Comptes'),
              onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/comptes");
              },
            ),
             const Divider(),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Creer un compte'),
              onTap: () {
                 /*   Navigator.pop(context);
                      Navigator.push(
                     context,
                      MaterialPageRoute(
                     builder: (context) => const CompteFormScreen()),
                    );
                    */
                     Navigator.pop(context);
                    Navigator.pushNamed(context, "/add");
              },
            ),
           const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Quitter'),
              onTap: () {
                
              },
             ),
            
          ]
        )
        ),
        body: const CompteListScreen(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
                       var routeName="/";
                       if (index==1) {
                            routeName="/comptes"; 
                       }
                         Navigator.pushNamed(context, routeName);
          },
          items:const  [
                BottomNavigationBarItem(
                 icon: Icon(Icons.home),
                 label: 'Home',
                ),
                BottomNavigationBarItem(
                 icon: Icon(Icons.account_balance_wallet),
                 label: 'Comptes',
               ),
                BottomNavigationBarItem(
                 icon: Icon(Icons.access_time),
                 label: 'Comptes',
               )
          
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
                   Navigator.pushNamed(context, "/add");
            
          },
        ),
      );
  }
}