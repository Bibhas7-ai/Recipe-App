import 'package:flutter/material.dart';
import 'package:food/provider/login_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                      text: 'Did You SignUp ? ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: ' SignUp now to  \n ',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                          text: 'Learn New  ',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: ' Recipes 😋 ',
                            style: TextStyle(
                              fontSize: 40,
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
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await registerProvider.registerUser(
                          emailController.text, passwordController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Registration successful')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: const Text('Already Signed Up?'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
