import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/schedule_provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleProvider provider = ScheduleProvider();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
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
                        value: provider.selectedCourse,
                        items: provider.courseList.map((String item) {
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
                            provider.selectedCourse = newValue!;
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
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                const Spacer(flex: 1),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
