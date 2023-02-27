import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karshenasi_project/provider/admin_provider.dart';

import '../my_theme.dart';

class AddTeacherScreen extends StatefulWidget {
  static String route = "/add_teacher";

  const AddTeacherScreen({Key? key}) : super(key: key);

  @override
  State<AddTeacherScreen> createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final _formKey = GlobalKey<FormState>();
  final AdminProvider provider = AdminProvider();
  late String token;
  late String name;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    token = arguments['token'];

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: SvgPicture.asset(
                        "assets/image/professor.svg",
                        height: 250,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "نام",
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        onSaved: (newValue) => name = newValue!,
                        onChanged: (value) {},
                        style: textTheme.bodySmall,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "ایمیل",
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        onSaved: (newValue) => email = newValue!,
                        onChanged: (value) {},
                        style: textTheme.bodySmall,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "رمز ورود",
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        obscureText: true,
                        onSaved: (newValue) => password = newValue!,
                        onChanged: (value) {},
                        style: textTheme.bodySmall,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (await provider.addUser(
                                name, email, password, token)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildSnackBar(Theme.of(context),
                                      "استاد با موفقیت ثبت شد", Colors.green));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildSnackBar(Theme.of(context),
                                      "متاسفانه خطایی رخ داد...", Colors.red));
                            }
                          }
                        },
                        child: Text(
                          "ثبت استاد",
                          style: textTheme.bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
