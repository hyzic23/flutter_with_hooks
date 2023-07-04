import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/models/user_model.dart';
import 'package:flutter_with_hooks_app/service/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreenWidget();
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final dio = Dio();
  List<UserModel> users = [];

  @override
  void initState() {
    setState(() {
      fetchUsers();
    });
    super.initState();
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          //final color = user.gender == 'male' ? Colors.blue : Colors.green;
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(user.image.thumbnail),
            ),
            title: Text(user.fullName),
            subtitle: Text(user.phone),
            //tileColor: color,
            //subtitle: Text(name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              fetchUsers();
            });
          },
          child: const Icon(Icons.add)),
      drawer: SizedBox(
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
