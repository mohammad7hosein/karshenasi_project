import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/my_theme.dart';
import 'package:karshenasi_project/provider/schedule_provider.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
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
                          provider.darsType == 3 || provider.darsType == 4
                              ? "انتخاب روز اول:"
                              : "انتخاب روز:",
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
                          provider.darsType == 3 || provider.darsType == 4
                              ? "انتخاب ساعت اول:"
                              : "انتخاب ساعت:",
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
                  if (provider.darsType == 3 || provider.darsType == 4)
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
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
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
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
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
                      ],
                    ),
                  if (provider.darsType == 3 || provider.darsType == 1)
                    Column(
                      children: [
                        RadioListTile(
                            title: Text(
                              "هفته زوج",
                              style: textTheme.bodyMedium,
                            ),
                            value: "z",
                            groupValue: provider.timeType,
                            onChanged: (newValue) {
                              setState(() {
                                provider.timeType = newValue;
                              });
                            }),
                        RadioListTile(
                            title: Text(
                              "هفته فرد",
                              style: textTheme.bodyMedium,
                            ),
                            value: "f",
                            groupValue: provider.timeType,
                            onChanged: (newValue) {
                              setState(() {
                                provider.timeType = newValue;
                              });
                            }),
                        if (provider.darsType == 3)
                          RadioListTile(
                              title: Text(
                                "هر هفته",
                                style: textTheme.bodyMedium,
                              ),
                              value: "x",
                              groupValue: provider.timeType,
                              onChanged: (newValue) {
                                setState(() {
                                  provider.timeType = newValue;
                                });
                              }),
                      ],
                    ),
                  const SizedBox(height: 20),
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
      await provider.checkCourseTime(token);
      if (provider.error) {
        ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
            theme, "شما در این زمان درس دیگری ثبت کرده اید", Colors.red));
      } else if (provider.warning) {
        showMyDialog(context, theme);
      } else {
        if (await provider.storeCourse(token, userId)) {
          ScaffoldMessenger.of(context).showSnackBar(
              buildSnackBar(theme, "درس با موفقیت ثبت شد", Colors.green));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              buildSnackBar(theme, "متاسفانه خطایی رخ داد...", Colors.red));
        }
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
                          onPressed: () async {
                            if (await provider.storeCourse(token, userId)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildSnackBar(theme, "درس با موفقیت ثبت شد",
                                      Colors.green));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildSnackBar(theme,
                                      "متاسفانه خطایی رخ داد...", Colors.red));
                            }
                            Navigator.pop(context);
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
