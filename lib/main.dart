import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'card application',
      home: HomeCardPage(),
    );
  }
}

class HomeCardPage extends StatefulWidget {
  const HomeCardPage({Key? key}) : super(key: key);

  @override
  State<HomeCardPage> createState() => _HomeCardPageState();
}

class _HomeCardPageState extends State<HomeCardPage> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Firstscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25.0),
              color: Colors.cyanAccent[100],
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'PERSONAL INFORMATION',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          decoration: TextDecoration.none),
                    ),
                  ),

                  //
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 80,
                              width: 80,
                              child: FlutterImage(),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'your Name',
                                  labelText: 'UserName',
                                  hintStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  labelStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your name ';
                                  }
                                  if (value.trim().length < 9) {
                                    return 'Username must be at least 9 characters in length';
                                  }
                                  // Return null if the entered username is valid
                                  return null;
                                },
                                onChanged: (value) => _userName = value,
                              ),
                            ),
                            //2nd container
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'example@gmail.com',
                                  labelText: 'Email',
                                  hintStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  labelStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  // Check if the entered email has the right format
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  // Return null if the entered email is valid
                                  return null;
                                },
                                onChanged: (value) => _userEmail = value,
                              ),
                            ),
                            //3rd container
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter password',
                                  labelText: 'Password',
                                  hintStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  labelStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter password';
                                  }
                                  if (value.trim().length < 8) {
                                    return 'Password must be at least 8 characters in length';
                                  }
                                  // Return null if the entered password is valid
                                  return null;
                                },
                                onChanged: (value) => _password = value,
                              ),
                            ),
                            //4th container
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Verify password',
                                  labelText: 'Confirm Password',
                                  hintStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  labelStyle:
                                      const TextStyle(color: Colors.pinkAccent),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter password to verify';
                                  }

                                  if (value != _password) {
                                    return 'Confimation password does not match the entered password';
                                  }

                                  return null;
                                },
                                onChanged: (value) => _confirmPassword = value,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: _trySubmitForm,
                          child: const Text('Sign Up')))
                ],
              ),
            )
          ],
        ));
  }
}

class FlutterImage extends StatelessWidget {
  const FlutterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/flutter.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}

class Firstscreen extends StatelessWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
