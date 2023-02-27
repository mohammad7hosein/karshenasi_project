import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/model/course.dart';
import '../provider/table_provider.dart';

class TableScreen extends StatefulWidget {
  static String route = "/table";

  const TableScreen({Key? key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final TableProvider provider = TableProvider();
  late final String token;
  late final int userId;
  bool isFirst = true;

  initData() async {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    token = arguments['token'];
    // userId = arguments['user_id'];
    await provider.getAllCourse(token);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      isFirst = false;
      initData();
    }
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: DataTable(
                headingTextStyle:
                    textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                dataTextStyle: textTheme.labelLarge,
                columnSpacing: 20,
                decoration: BoxDecoration(
                  color: const Color(0xff2bb4ff),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black45,
                  width: 0.5,
                ),
                horizontalMargin: 10,
                columns: [
                  const DataColumn(label: Text("")),
                  DataColumn(
                      label: Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: const Text("شنبه"))),
                  DataColumn(
                      label: Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: const Text("یکشنبه"))),
                  DataColumn(
                      label: Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: const Text("دوشنبه"))),
                  DataColumn(
                      label: Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: const Text("سه شنبه"))),
                  DataColumn(
                      label: Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: const Text("چهارشنبه"))),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Center(
                          child: Text(
                        "10_8",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ))),
                      DataCell(
                        Text(provider.row00.isEmpty
                            ? ""
                            : provider.row00[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row00);
                        },
                      ),
                      DataCell(
                        Text(provider.row01.isEmpty
                            ? ""
                            : provider.row01[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row01);
                        },
                      ),
                      DataCell(
                        Text(provider.row02.isEmpty
                            ? ""
                            : provider.row02[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row02);
                        },
                      ),
                      DataCell(
                        Text(provider.row03.isEmpty
                            ? ""
                            : provider.row03[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row03);
                        },
                      ),
                      DataCell(
                        Text(provider.row04.isEmpty
                            ? ""
                            : provider.row04[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row04);
                        },
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(
                          child: Text(
                        "12_10",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ))),
                      DataCell(
                        Text(provider.row10.isEmpty
                            ? ""
                            : provider.row10[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row10);
                        },
                      ),
                      DataCell(
                        Text(provider.row11.isEmpty
                            ? ""
                            : provider.row11[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row11);
                        },
                      ),
                      DataCell(
                        Text(provider.row12.isEmpty
                            ? ""
                            : provider.row12[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row12);
                        },
                      ),
                      DataCell(
                        Text(provider.row13.isEmpty
                            ? ""
                            : provider.row13[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row13);
                        },
                      ),
                      DataCell(
                        Text(provider.row14.isEmpty
                            ? ""
                            : provider.row14[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row14);
                        },
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(
                          child: Text(
                        "15:30_13:30",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ))),
                      DataCell(
                        Text(provider.row20.isEmpty
                            ? ""
                            : provider.row20[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row20);
                        },
                      ),
                      DataCell(
                        Text(provider.row21.isEmpty
                            ? ""
                            : provider.row21[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row21);
                        },
                      ),
                      DataCell(
                        Text(provider.row22.isEmpty
                            ? ""
                            : provider.row22[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row22);
                        },
                      ),
                      DataCell(
                        Text(provider.row23.isEmpty
                            ? ""
                            : provider.row23[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row23);
                        },
                      ),
                      DataCell(
                        Text(provider.row24.isEmpty
                            ? ""
                            : provider.row24[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row24);
                        },
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(
                          child: Text(
                        "17:30_15:30",
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ))),
                      DataCell(
                        Text(provider.row30.isEmpty
                            ? ""
                            : provider.row30[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row30);
                        },
                      ),
                      DataCell(
                        Text(provider.row31.isEmpty
                            ? ""
                            : provider.row31[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row31);
                        },
                      ),
                      DataCell(
                        Text(provider.row32.isEmpty
                            ? ""
                            : provider.row32[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row32);
                        },
                      ),
                      DataCell(
                        Text(provider.row33.isEmpty
                            ? ""
                            : provider.row33[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row33);
                        },
                      ),
                      DataCell(
                        Text(provider.row34.isEmpty
                            ? ""
                            : provider.row34[0].name!),
                        onTap: () {
                          showMyDialog(context, provider.row34);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showMyDialog(BuildContext context, List<Course> courses) {
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
            height: 150,
            width: 100,
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      "${courses[index].teacherName} _ ${courses[index].year} _ ${getTimeType(courses[index].day2Type)} ${courses[index].name}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (index != courses.length - 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 1),
                      ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  getTimeType(String? type) {
    if (type == null) {
      return "";
    } else if (type == "z") {
      return "(زوج)";
    } else if (type == "f") {
      return "(فرد)";
    }
  }
}
