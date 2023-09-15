import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fotodesk/features/admin_manager/presentation/pages/admin_manager_page.dart';
import 'package:fotodesk/generated/locale_keys.g.dart';

import '../../../../core/di/injector.dart';
import '../../domain/usecases/login_user.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _title(context),
                const SizedBox(height: 16),
                _customTextField(LocaleKeys.authentification_login.tr(),
                    Icons.person_outline, _emailController),
                const SizedBox(height: 12),
                _customTextField(LocaleKeys.authentification_password.tr(),
                    Icons.lock_outline, _passwordController,
                    isPassword: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    final loginUser = getIt<LoginUser>();
                    final response = await loginUser.call(email, password);

                    // Checking if the response contains a successful user login
                    response.fold(
                      (failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login failed!')),
                        );
                      },
                      (user) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged in!')),
                        );
                        // Navigate to the CustomPage upon successful login
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const AdminManagerPage()));
                      },
                    );
                  },
                  child: Text(LocaleKeys.authentification_login.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      LocaleKeys.authentification_title.tr(),
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
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
