import 'package:flutter/material.dart';
import 'package:food/provider/login_provider.dart';
import 'package:provider/provider.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Login To Learn \n New ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: ' Delicious! \n ',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: ' Recipes 😋 ',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Email Here',
                        labelText: 'Email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Password Here',
                        labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginProvider.login(
                        context,
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await loginProvider.loginWithGoogle();
                    },
                    child: Text('SignIn with Google'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/register',
                        (route) => false,
                      );
                    },
                    child: const Text("Don't have an account? Sign Up"),
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
