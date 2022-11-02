import 'package:flutter/material.dart';
import 'package:todo_app_final_eraasoft/Ui/screens/tasks_screen.dart';
import 'package:todo_app_final_eraasoft/api/dio_helper.dart';



import '../../api/endpoints.dart';

import '../../constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B475E),
      body: Center(
        child: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const CircleAvatar(
                      radius: 100,
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage('assets/login.jpg'),
                      )),
                  const Text(
                    'Login Page',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'pacifico'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 200, vertical: 40),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter your Email';
                        } else if (value.contains('@gmail.com')) {
                          return 'PLease, Enter a Valid Email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 200, vertical: 30),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter your Password';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your password',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            DioHelper.postData(endPoint: loginUrl, query: {
                              "email": emailController.text,
                              "password": passwordController.text
                            }).then((value) {
                              print(value.data);
                              token = value.data['authorisation']['token'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TasksScreen()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Login successfully"),
                                      backgroundColor: Colors.teal,
                                      duration: Duration(seconds: 3)));
                              // print("==================");
                              //print(token);
                            }).catchError((error) {
                              print('Login Error Here ${error.response.data}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("${error.response.data}"),
                                      backgroundColor: Colors.teal,
                                      duration: const Duration(seconds: 5)));
                            });
                          }
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
