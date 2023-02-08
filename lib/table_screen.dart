import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/table_provider.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final TableProvider provider = TableProvider();

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
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                DataTable(
                  headingTextStyle: textTheme.bodySmall,
                  columnSpacing: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    width: 1,
                  ),
                  horizontalMargin: 10,
                  columns: const [
                    DataColumn(label: Text("")),
                    DataColumn(label: Text("شنبه")),
                    DataColumn(label: Text("یکشنبه")),
                    DataColumn(label: Text("دوشنبه")),
                    DataColumn(label: Text("سه شنبه")),
                    DataColumn(label: Text("چهارشنبه")),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Center(child: Text("8_10"))),
                        DataCell(Text(provider.rows[0][0]), onTap: () {
                          setState(() {
                            provider.rows[0][0] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[0][0] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[0][1]), onTap: () {
                          setState(() {
                            provider.rows[0][1] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[0][1] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[0][2]), onTap: () {
                          setState(() {
                            provider.rows[0][2] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[0][2] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[0][3]), onTap: () {
                          setState(() {
                            provider.rows[0][3] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[0][3] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[0][4]), onTap: () {
                          setState(() {
                            provider.rows[0][4] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[0][4] = "";
                          });
                        }),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Center(child: Text("10_12"))),
                        DataCell(Text(provider.rows[1][0]), onTap: () {
                          setState(() {
                            provider.rows[1][0] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[1][0] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[1][1]), onTap: () {
                          setState(() {
                            provider.rows[1][1] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[1][1] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[1][2]), onTap: () {
                          setState(() {
                            provider.rows[1][2] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[1][2] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[1][3]), onTap: () {
                          setState(() {
                            provider.rows[1][3] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[1][3] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[1][4]), onTap: () {
                          setState(() {
                            provider.rows[1][4] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[1][4] = "";
                          });
                        }),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Center(child: Text("13:30_15:30"))),
                        DataCell(Text(provider.rows[2][0]), onTap: () {
                          setState(() {
                            provider.rows[2][0] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[2][0] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[2][1]), onTap: () {
                          setState(() {
                            provider.rows[2][1] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[2][1] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[2][2]), onTap: () {
                          setState(() {
                            provider.rows[2][2] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[2][2] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[2][3]), onTap: () {
                          setState(() {
                            provider.rows[2][3] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[2][3] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[2][4]), onTap: () {
                          setState(() {
                            provider.rows[2][4] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[2][4] = "";
                          });
                        }),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Center(child: Text("15:30_17:30"))),
                        DataCell(Text(provider.rows[3][0]), onTap: () {
                          setState(() {
                            provider.rows[3][0] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[3][0] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[3][1]), onTap: () {
                          setState(() {
                            provider.rows[3][1] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[3][1] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[3][2]), onTap: () {
                          setState(() {
                            provider.rows[3][2] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[3][2] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[3][3]), onTap: () {
                          setState(() {
                            provider.rows[3][3] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[3][3] = "";
                          });
                        }),
                        DataCell(Text(provider.rows[3][4]), onTap: () {
                          setState(() {
                            provider.rows[3][4] = provider.selectedCourse!;
                          });
                        }, onLongPress: () {
                          setState(() {
                            provider.rows[3][4] = "";
                          });
                        }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        hint: Text(
                          "لیست دروس",
                          style: textTheme.bodyMedium,
                        ),
                        value: provider.selectedCourse,
                        items: provider.courseList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: textTheme.bodyMedium,
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
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
