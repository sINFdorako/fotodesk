import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fotodesk/core/router/router.gr.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/features/notifications/presentation/widgets/notifications.dart';
import '../../domain/usecases/login_user.dart';
import '../widgets/background_shapes_painter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text('LOGO'), // Place your logo here.
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Sign In Section
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('In Fotodesk einloggen',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.mail)), // Google Login Icon
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.link)), // LinkedIn Login Icon
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.apple)), // Apple Login Icon
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text('oder benutze deinen E-Mail Account:'),
                              const SizedBox(
                                height: 8,
                              ),
                              _customTextField('Email', Icons.person_outline,
                                  _emailController),
                              const SizedBox(
                                height: 4,
                              ),
                              _customTextField('Passwort', Icons.lock_outline,
                                  _passwordController,
                                  isPassword: true),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Forgot your password?')),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final email = _emailController.text;
                                  final password = _passwordController.text;

                                  final loginUser = getIt<LoginUser>();
                                  final response =
                                      await loginUser.call(email, password);

                                  // Checking if the response contains a successful user login
                                  response.fold(
                                    (failure) {
                                      Notifications(context)
                                          .showError('Fehler beim Login');
                                    },
                                    (user) {
                                      Notifications(context).showSuccess(
                                          'Erfolgreich eingeloggt');
                                      context.router
                                          .push(const AdminManagerRoute());
                                    },
                                  );
                                },
                                child: const Text('Einloggen'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Sign Up Section
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(context).colorScheme.primary
                              ]),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                      child: CustomPaint(
                        painter: BackgroundShapesPainter(),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Change this to center the items horizontally.
                            children: [
                              Text('Hallo liebe Fotografen!',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                'Erweitern Sie Ihren fotografischen Horizont. \n Registrieren Sie sich und vereinfachen Sie Ihre Arbeit!',
                                textAlign: TextAlign
                                    .center, // To center-align the text.
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Sign Up'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(
      String hintText, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
