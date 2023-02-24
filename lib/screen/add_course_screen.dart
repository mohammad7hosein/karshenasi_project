import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karshenasi_project/model/user.dart';
import 'package:karshenasi_project/provider/admin_provider.dart';

import '../my_theme.dart';

class AddCourseScreen extends StatefulWidget {
  static String route = "/add_course";

  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  late final AdminProvider provider = AdminProvider();
  final _formKey = GlobalKey<FormState>();
  late String token;
  late String name;
  bool isFirst = true;

  initData() async {
    if (isFirst) {
      isFirst = false;
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      token = arguments['token'];
      await provider.getAllUser(token);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    initData();
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/image/course.svg",
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "نام درس",
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
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        underline: Container(),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.keyboard_arrow_down_rounded),
                        ),
                        hint: Text(
                          "تعداد واحد درس",
                          style: textTheme.bodySmall,
                        ),
                        value: provider.selectedCourseType,
                        items: provider.courseTypes.map((int item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Center(
                              child: Text(
                                "$item",
                                style: textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          setState(() {
                            provider.selectedCourseType = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        underline: Container(),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.keyboard_arrow_down_rounded),
                        ),
                        hint: Text(
                          "استاد درس",
                          style: textTheme.bodySmall,
                        ),
                        value: provider.selectedTeacher,
                        items: provider.teacherNames.map((User item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Center(
                              child: Text(
                                item.name!,
                                style: textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (User? newValue) {
                          setState(() {
                            provider.selectedTeacher = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (await provider.addDars(name, token)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildSnackBar(Theme.of(context),
                                      "درس با موفقیت ثبت شد", Colors.green));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildSnackBar(Theme.of(context),
                                      "متاسفانه خطایی رخ داد...", Colors.red));
                            }
                          }
                        },
                        child: Text(
                          "ثبت درس",
                          style: textTheme.bodyMedium
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
      ),
    );
  }
}
