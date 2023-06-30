import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/models/user.dart';
import 'package:flutter_with_hooks_app/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final GlobalKey _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Future<User> user;
  //late User user;

  Future<User> login(String username, String password) async {
    //User Login(String username, String password) async {
    var url = Uri.http('localhost:5096', '/api/User/authenticate-users');
    //var url = Uri.http('localhost:7210', '/api/User/authenticate-users');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    final jsonRequest =
        jsonEncode({'username': username, 'password': password});
    final response = await http.post(url, headers: headers, body: jsonRequest);
    //print('Response <<<>>> ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  //Future<ApiResponse> Login(String username, String password) async {
  // ApiResponse apiResponse = new ApiResponse();
  // var url = Uri.http('localhost:5096', '/api/User/authenticate-users');
  // Map<String, String> headers = {
  //   'content-type': 'application/json',
  //   'accept': 'application/json',
  // };

  // final jsonRequest =
  //     jsonEncode({'username': username, 'password': password});

  // var response = await http.post(url, headers: headers, body: jsonRequest);
  // final responseData = jsonDecode(response.body) as Map<String, dynamic>;
  // print('respponse <<<<<<<||>>>>>>> : $responseData');

  // User user = User.fromJson(jsonDecode(response.body));
  // print('User Response <<<<<<<||>>>>>>> : ${user.username}');

  // apiResponse.Data = User.fromJson(jsonDecode(response.body));

  // User userResponse = apiResponse.Data as User;
  //if (userResponse.username != null) {
  // Navigator.of(context)
  //     .push(MaterialPageRoute(builder: (context) => const HomeScreen()));

  // Navigator.pushNamedAndRemoveUntil(
  //   context, => HomeScreen(), ModalRoute.withName('/home'),
  //   arguments: (apiResponse.Data as User));
  // }
  //print('User <<<<<<<||>>>>>>> : ${us.username}');

  //return apiResponse;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //body: SingleChildScrollView(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/desire_logoo.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15)),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));

                      // user =
                      //     Login(emailController.text, passwordController.text);
                      //Future<User> responseUser =
                      //login(emailController.text, passwordController.text);
                      //User users = responseUser as User;
                      //print('${users.username}');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             HomeScreen(user: users.username)));

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const HomeScreen()));

                      // Navigate the user to the Home page
                      // Future<ApiResponse> response =
                      //     Login(emailController.text, passwordController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill input')),
                      );
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 130),
              const Text('New User? Create Account')
            ],
          ),
        ));
  }
}



// class HooksExample extends HookWidget {
//   const HooksExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final counter = useState(0);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Hooks'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Text('You have tapped ${counter.value} times')],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           counter.value++;
//         },
//         child: const Icon(Icons.add),
//       ),
//     ));
//   }
// }





// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
