import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/router/router.gr.dart';
import 'package:fotodesk/features/authentification/presentation/cubit/auth_cubit.dart';

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
      body: Column(
        children: [
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
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)),
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
                            Text(
                              'oder benutze deinen E-Mail Account:',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
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
                              child: Text('Forgot your password?',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomButton(
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
                                    Notifications(context)
                                        .showSuccess('Erfolgreich eingeloggt');
                                    context.router
                                        .push(const AdminManagerRoute());
                                  },
                                );
                              },
                              label: 'Einloggen',
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
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16))),
                    child: CustomPaint(
                      painter: BackgroundShapesPainter(),
                      child: Stack(
                        children: [
                          _registerInfo(),
                          _switchThemeButton(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onBackground),
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _switchThemeButton() {
    return Positioned(
      right: 16,
      bottom: 16,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.read<AuthCubit>().toggleTheme();
        },
        child: Row(
          children: [
            Text(
              context.watch<AuthCubit>().state.isLight
                  ? 'Switch to dark'
                  : 'Switch to light',
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // rounded corners
              ),
              child: Icon(
                context.watch<AuthCubit>().state.isLight
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: context.watch<AuthCubit>().state.isLight
                    ? Colors.white.withOpacity(.5)
                    : Colors.black.withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerInfo() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Hallo liebe Fotografen!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Erweitern Sie Ihren fotografischen Horizont. \n Registrieren Sie sich und vereinfachen Sie Ihre Arbeit!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              label: 'Jetzt Registrieren',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
