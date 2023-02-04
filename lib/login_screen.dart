import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/table_screen.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String phoneNumber;
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
      resizeToAvoidBottomInset: true,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                Text(
                  "به سیستم مدیریت برنامه اساتید خوش آمدید",
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                Text(
                  "نام کاربری",
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    onSaved: (newValue) => phoneNumber = newValue!,
                    onChanged: (value) {},
                    style: theme.textTheme.bodySmall,
                    keyboardType: TextInputType.phone,
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
                const Spacer(flex: 1),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      check();
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
    );
  }

  void check() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const TableScreen()));
  }
}
