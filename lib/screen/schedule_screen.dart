import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/my_theme.dart';
import 'package:karshenasi_project/provider/schedule_provider.dart';
import 'package:karshenasi_project/screen/table_screen.dart';
import '../model/dars.dart';

class ScheduleScreen extends StatefulWidget {
  static String route = "/schedule";

  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleProvider provider = ScheduleProvider();
  late final String token;
  late final int userId;
  var checkTime1 = false;
  var checkTime2 = false;
  bool isFirst = true;

  initData() async {
    if (isFirst) {
      isFirst = false;
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      token = arguments['token'];
      userId = arguments['user_id'];
      await provider.getAllDars(token, userId);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    initData();
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        "انتخاب درس :",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      child: DropdownButton(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        hint: Text(
                          "لیست دروس",
                          style: textTheme.bodySmall,
                        ),
                        value: provider.selectedDars,
                        items: provider.darsList.map((Dars item) {
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
                        onChanged: (Dars? newValue) async {
                          provider.selectedDars = newValue!;
                          await provider.checkDarsType(
                              token, provider.selectedDars!.id!);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        "انتخاب روز اول:",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      child: DropdownButton(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        hint: Text(
                          "روز درس",
                          style: textTheme.bodySmall,
                        ),
                        value: provider.selectedDay1,
                        items: provider.dayList.map((String item) {
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
                            provider.selectedDay1 = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        "انتخاب ساعت اول:",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      child: DropdownButton(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        hint: Text(
                          "ساعت درس",
                          style: textTheme.bodySmall,
                        ),
                        value: provider.selectedClock1,
                        items: provider.clockList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Center(
                              child: Text(
                                item,
                                style: textTheme.bodyMedium,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            provider.selectedClock1 = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (provider.darsType == 3)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "انتخاب روز دوم:",
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                            child: DropdownButton(
                              underline: Container(),
                              borderRadius: BorderRadius.circular(10),
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              hint: Text(
                                "روز درس",
                                style: textTheme.bodySmall,
                              ),
                              value: provider.selectedDay2,
                              items: provider.dayList.map((String item) {
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
                                  provider.selectedDay2 = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "انتخاب ساعت دوم:",
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                            child: DropdownButton(
                              underline: Container(),
                              borderRadius: BorderRadius.circular(10),
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              hint: Text(
                                "ساعت درس",
                                style: textTheme.bodySmall,
                              ),
                              value: provider.selectedClock2,
                              items: provider.clockList.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Center(
                                    child: Text(
                                      item,
                                      style: textTheme.bodyMedium,
                                      textDirection: TextDirection.ltr,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  provider.selectedClock2 = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text("هفته زوج"),
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: provider.isEven,
                              onChanged: (newValue) {
                                setState(() {
                                  provider.isEven = newValue!;
                                });
                              }),
                          const Spacer(),
                          const Text("هفته فرد"),
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: !provider.isEven,
                              onChanged: (newValue) {
                                setState(() {
                                  provider.isEven = !newValue!;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                const Spacer(flex: 1),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      storeCourse(Theme.of(context));
                    },
                    child: Text(
                      "ثبت درس",
                      style:
                          textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  storeCourse(ThemeData theme) async {
    if (provider.selectedDars == null ||
        provider.selectedDay1 == null ||
        provider.selectedClock1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          buildSnackBar(theme, "لطفا همه موارد را انتخاب کنید", Colors.red));
    } else {
      checkTime1 = false;
      checkTime2 = false;
      checkTime1 = await provider.checkCourseTime(provider.selectedDay1!,
          provider.selectedClock1!, provider.courseType, token);
      if (provider.darsType == 3) {
        checkTime2 = await provider.checkCourseTime(provider.selectedDay2!,
            provider.selectedClock2!, provider.courseType, token);
      }
      if (checkTime1 || checkTime2) {
        showMyDialog(context, theme);
      } else {
        provider.storeCourse(token, userId);
        ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(theme, "درس با موفقیت ثبت شد", Colors.green));
      }
    }
  }

  showMyDialog(BuildContext context, ThemeData theme) async {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "زمان این درس با درس دیگری در تداخل است. آیا از ثبت درس اطمینان دارید؟",
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () {
                            provider.storeCourse(token, userId);
                            ScaffoldMessenger.of(context).showSnackBar(
                                buildSnackBar(theme, "درس با موفقیت ثبت شد",
                                    Colors.green));
                          },
                          child: const Text("بله")),
                      const SizedBox(width: 20),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("خیر")),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
