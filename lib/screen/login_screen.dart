import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/provider/login_provider.dart';
import 'package:karshenasi_project/my_theme.dart';
import 'package:karshenasi_project/screen/bottom_nav_bar.dart';
import 'package:karshenasi_project/screen/schedule_screen.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginProvider provider = LoginProvider();
  final _formKey = GlobalKey<FormState>();
  late String email;
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ورود به حساب کاربری",
          style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
        ),
      ),
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
                  const SizedBox(height: 20),
                  Text(
                    "به سیستم مدیریت برنامه اساتید خوش آمدید",
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  Text(
                    "نام کاربری",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      onSaved: (newValue) => email = newValue!,
                      onChanged: (value) {},
                      style: theme.textTheme.bodySmall,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 30),
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
                  const SizedBox(height: 180),
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
      bool isValid = await provider.login(email, password);
      if (isValid) {
        Navigator.pushReplacementNamed(context, BottomNavBar.route, arguments: {
          'token': provider.token,
          'user_id': provider.userId,
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(theme, "اطلاعات وارد شده نادرست است", Colors.red));
      }
    }
  }
}
