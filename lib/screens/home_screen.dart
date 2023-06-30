import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/models/user.dart';

class HomeScreen extends StatelessWidget {
  //final String user;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenWidget();
  }
}

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: const Column(
        children: [Text('Welcome to my Home Page')],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Demostration Demo"),
                accountEmail: Text("demo@demo.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    'D',
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                //child: Text('Drawer Head')
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.access_alarm),
                title: const Text('Schedule Payments'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_balance),
                title: const Text('Transactions'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text('Contact Us'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Then close the drawer
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
