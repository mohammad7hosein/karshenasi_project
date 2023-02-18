import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  initData() async {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    token = arguments['token'];
    userId = arguments['user_id'];
    await provider.getAllCourse(userId, token);
    // setState(() {});
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
    initData();
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: DataTable(
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
                      const DataCell(Center(child: Text("8_10"))),
                      DataCell(Text(provider.rows[0][0])),
                      DataCell(Text(provider.rows[0][1])),
                      DataCell(Text(provider.rows[0][2])),
                      DataCell(Text(provider.rows[0][3])),
                      DataCell(Text(provider.rows[0][4])),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Center(child: Text("10_12"))),
                      DataCell(Text(provider.rows[1][0])),
                      DataCell(Text(provider.rows[1][1])),
                      DataCell(Text(provider.rows[1][2])),
                      DataCell(Text(provider.rows[1][3])),
                      DataCell(Text(provider.rows[1][4])),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Center(child: Text("13:30_15:30"))),
                      DataCell(Text(provider.rows[2][0])),
                      DataCell(Text(provider.rows[2][1])),
                      DataCell(Text(provider.rows[2][2])),
                      DataCell(Text(provider.rows[2][3])),
                      DataCell(Text(provider.rows[2][4])),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Center(child: Text("15:30_17:30"))),
                      DataCell(Text(provider.rows[3][0])),
                      DataCell(Text(provider.rows[3][1])),
                      DataCell(Text(provider.rows[3][2])),
                      DataCell(Text(provider.rows[3][3])),
                      DataCell(Text(provider.rows[3][4])),
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
}
