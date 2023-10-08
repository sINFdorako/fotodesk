import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_text_field.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/screen_size.dart';
import 'package:fotodesk/core/router/router.gr.dart';
import 'package:fotodesk/features/authentification/data/datasources/local_data_source.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';
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

  late User? user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    user = await LocalDataSource().getUser();
    if (user != null) {
      _emailController.text = user!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
              child: ScreenSize.isMobile(context)
                  ? Column(
                      children: [
                        _loginSide(),
                        _registerSide(),
                      ],
                    )
                  : Row(
                      children: [
                        _loginSide(),
                        _registerSide(),
                      ],
                    )),
        ],
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
      padding: EdgeInsets.all(24.0.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hallo liebe Fotografen!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: FontUtil.h1,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              'Erweitern Sie Ihren fotografischen Horizont. \n Registrieren Sie sich und vereinfachen Sie Ihre Arbeit!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: FontUtil.h2),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(
              customFontColor: Colors.white.withOpacity(.85),
              isColor: true,
              width: 100.w,
              label: 'Jetzt Registrieren',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  _loginSide() {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('In Fotodesk einloggen',
                    style: TextStyle(
                        fontSize: FontUtil.h1,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground)),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mail)), // Google Login Icon
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.link)), // LinkedIn Login Icon
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple)), // Apple Login Icon
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'oder benutze deinen E-Mail Account:',
                  style: TextStyle(
                      fontSize: FontUtil.paragraph,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextField(
                    hintText: 'Email',
                    icon: Icons.person_outline,
                    controller: _emailController),
                SizedBox(
                  height: 4.h,
                ),
                CustomTextField(
                    hintText: 'Passwort',
                    icon: Icons.lock_outline,
                    controller: _passwordController,
                    isPassword: true),
                TextButton(
                  onPressed: () {},
                  child: Text('Passwort vergessen?',
                      style: TextStyle(
                          fontSize: FontUtil.button,
                          color: Theme.of(context).colorScheme.onBackground)),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    final loginUser = getIt<LoginUser>();
                    final response = await loginUser.execute(email, password);

                    // Checking if the response contains a successful user login
                    response.fold(
                      (failure) {
                        Notifications(context).showError('Fehler beim Login');
                      },
                      (user) {
                        Notifications(context)
                            .showSuccess('Erfolgreich eingeloggt');
                        context.router.push(const AdminManagerRoute());
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
    );
  }

  _registerSide() {
    return Expanded(
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
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
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
    );
  }
}
