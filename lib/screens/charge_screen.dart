import 'package:flutter/material.dart';

class ChargeScreen extends StatefulWidget {
  ChargeScreen({Key key}) : super(key: key);

  @override
  _ChargeScreenState createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getDataTable(),
    );
  }

  DataColumn createColumn(String columnName) {
    return DataColumn(label: Text(columnName, style: TextStyle(fontStyle: FontStyle.normal)));
  }

  DataRow createRow(String date, String power, String time) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(date)),
        DataCell(Text(power)),
        DataCell(Text(time)),
      ],
    );
  }

  Widget getDataTable() {
    List<DataRow> dataRows = [];
    for(int i=0; i<30; i++) {
      dataRows.add(createRow("21.02.2021", "3." + i.toString() + " Kw", "13:2"+ i.toString()));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        child: DataTable(
          columns: <DataColumn>[
            createColumn("Date"),
            createColumn("Power"),
            createColumn("Time"),
          ],
          rows: dataRows,
        ),
      ),
    );
  }

}

// StatisticData data = StatisticData();
// class StatisticData {
//   List<StatisticInfo> dataInfo = [];
//
//   void initData(int size) {
//     for (int i = 0; i < size; i++) {
//       dataInfo.add(StatisticInfo("21.02.2021", "3.5"));
//     }
//   }
// }

