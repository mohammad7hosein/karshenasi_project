import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/my_theme.dart';
import 'package:karshenasi_project/provider/login_provider.dart';
import 'package:karshenasi_project/screen/admin_screen.dart';
import 'package:karshenasi_project/screen/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginProvider provider = LoginProvider();
  final _formKey = GlobalKey<FormState>();
  late String username;
  late String password;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "ورود به حساب کاربری",
      //     style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
      //   ),
      // ),
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      "assets/image/qom_logo.png",
                      width: 250,
                      height: 250,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "به سیستم مدیریت برنامه اساتید خوش آمدید",
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "نام کاربری",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      onSaved: (newValue) => username = newValue!,
                      onChanged: (value) {},
                      style: theme.textTheme.bodySmall,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "رمز ورود",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (newValue) => password = newValue!,
                      onChanged: (value) {},
                      style: theme.textTheme.bodySmall,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        check(theme);
                      },
                      child: Text(
                        "ورود",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> check(ThemeData theme) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool isValid = await provider.login(username, password);
      if (isValid) {
        provider.isAdmin
            ? Navigator.pushReplacementNamed(
                context,
                AdminScreen.route,
                arguments: {
                  'token': provider.token,
                },
              )
            : Navigator.pushReplacementNamed(
                context,
                BottomNavBar.route,
                arguments: {
                  'token': provider.token,
                  'user_id': provider.userId,
                },
              );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(theme, "اطلاعات وارد شده نادرست است", Colors.red));
      }
    }
  }
}
