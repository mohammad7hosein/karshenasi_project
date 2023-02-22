import 'package:flutter/material.dart';

class AddTeacherScreen extends StatefulWidget {
  static String route = "/add_teacher";

  const AddTeacherScreen({Key? key}) : super(key: key);

  @override
  State<AddTeacherScreen> createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final _formKey = GlobalKey<FormState>();
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "نام کاربری",
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      onSaved: (newValue) => username = newValue!,
                      onChanged: (value) {},
                      style: textTheme.bodySmall,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 30),
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
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "ثبت استاد",
                        style:
                            textTheme.bodyMedium?.copyWith(color: Colors.white),
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
}
