import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
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
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            child: DataTable(
              headingTextStyle: textTheme.bodySmall,
              columnSpacing: 70,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              border: TableBorder.all(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  width: 1),
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
                    DataCell(Center(child: Text("8-10")), onTap: () {}),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Center(child: Text("10_12"))),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Center(child: Text("13:30_15:30"))),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Center(child: Text("15:30_17:30"))),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
