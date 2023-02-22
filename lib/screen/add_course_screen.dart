import 'package:flutter/material.dart';
import 'package:karshenasi_project/provider/admin_provider.dart';

class AddCourseScreen extends StatefulWidget {
  static String route = "/add_course";

  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  late final AdminProvider provider = AdminProvider();
  final _formKey = GlobalKey<FormState>();
  late String name;

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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 50),
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
                      items: provider.courseTypes.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Center(
                            child: Text(
                              item,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          provider.selectedCourseType = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
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
                      value: provider.selectedTeacherName,
                      items: provider.teacherNames.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Center(
                            child: Text(
                              item,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          provider.selectedTeacherName = newValue!;
                        });
                      },
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "ثبت درس",
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
