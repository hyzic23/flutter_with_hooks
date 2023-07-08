import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_hooks_app/models/user.dart';
import 'package:flutter_with_hooks_app/screens/home_screen.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Future<User> user;
  final dio = Dio();

  Future<User?> validateUser(String username, String password) async {
    const url = 'http://localhost:5096/api/User/authenticate-users';
    User? userResponse;
    try {
      Response response = await dio
          .post(url, data: {'username': username, 'password': password});
      userResponse = User.fromJson(response.data);
      String userN = userResponse.username;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HomeScreen(
                  //username: userN,
                  )));

      // Navigator.pushNamed(
      //     context, MaterialPageRoute(builder: (context) => const HomeScreen()),
      //     arguments: userResponse);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
    // Fluttertoast.showToast(
    //     msg: "Login Successfull", backgroundColor: Colors.cyan);

    return userResponse;
  }

  Future<User?> validateDummyUser(String username, String password) async {
    if (username == 'admin' && password == 'admin') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {}
    return null;
  }

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
                  child: SizedBox(
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
                      validateDummyUser(
                          emailController.text, passwordController.text);
                      // validateUser(
                      //     emailController.text, passwordController.text);

                      // Future<User?> response = validateUser(
                      //     emailController.text, passwordController.text);
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
