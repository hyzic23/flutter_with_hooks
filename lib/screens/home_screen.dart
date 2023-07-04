import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  //final String? username;
  const HomeScreen({super.key});
  //const HomeScreen({super.key, required this.username});

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
    print('Init Method');
    setState(() {
      print('Init SetState Method');
      fetchUsers();
    });
    super.initState();
  }

  void fetchUsers() async {
    print('Calling FetchUsers API');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //final response = await dio.get(url);
    // final response = await dio.get(url);
    //final result = response.data;
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((user) {
      final name = UserName(
          title: user['name']['title'],
          first: user['name']['first'],
          last: user['name']['last']);

      return UserModel(
          gender: user['gender'],
          email: user['email'],
          phone: user['phone'],
          cell: user['cell'],
          nat: user['nat'],
          name: name);
    }).toList();

    setState(() {
      users = transformed;
      //users = json['results'];
    });
    print('Fetch Users completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      //body: const Text('Hello'),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(), // new
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          //final color = user.gender == 'male' ? Colors.blue : Colors.green;
          // final email = user['email'];
          // final name = user['name']['first'];
          // final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            // leading: ClipRRect(
            //   borderRadius: BorderRadius.circular(100),
            //   child: Image.network(imageUrl),
            // ),
            title: Text(user.name.first),
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
