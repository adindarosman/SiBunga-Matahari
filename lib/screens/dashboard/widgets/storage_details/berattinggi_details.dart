import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/models/FetchDataPertumbuhan.dart';
import 'package:SiBunga/screens/dashboard/widgets/my_files/my_files.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_chart/bb_tb_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BeratTinggi_details extends StatefulWidget {
  final List<ModelDataPertumbuhan> dataPertumbuhanList;

  const BeratTinggi_details({
    Key? key,
    required this.dataPertumbuhanList,
  }) : super(key: key);

  @override
  State<BeratTinggi_details> createState() => _BeratTinggi_detailsState();
}

class _BeratTinggi_detailsState extends State<BeratTinggi_details> {
  final _dateFormat = DateFormat('dd/MM/yyyy');
  late List<ModelDataPertumbuhan> dataPertumbuhanList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Call fetchGrowthData to retrieve growth data
    dataPertumbuhanList = await fetchDataPertumbuhan();

    // Set state to trigger a rebuild with the fetched data
    setState(() {});
  }

  List<DataRow> get tableRows {
    return dataPertumbuhanList.map((data) {
      return DataRow(cells: [
        DataCell(Text(_dateFormat.format(data.date))),
        DataCell(Text(data.beratBadan?.toString() ?? '')),
        DataCell(Text(data.tinggiBadan?.toString() ?? '')),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context);
    return Container(
      padding: sizes.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: sizes.defaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center align the children
        children: [
          Text(
            "Berat Badan Terhadap Tinggi Badan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: sizes.defaultPaddingValue),
          BBdgnTB_chart(),
          SizedBox(height: sizes.defaultPaddingValue),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: const Color.fromARGB(255, 98, 98, 98),
                borderRadius: sizes.defaultBorderRadius),
            child: DataTable(
              headingRowHeight: 60,
              columnSpacing: 30.0,
              columns: [
                DataColumn(
                  label: Text(
                    "Tanggal",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Berat\nBadan(kg)",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Tinggi\nBadan(cm)",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              rows: tableRows,
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: BeratTinggi_details(
//           infoAnakData: [
//             InfoAnakScreen(
//               dateInput: DateTime.now(),
//               beratBadan: "10.5",
//               tinggiBadan: "80.0",
//             ),
//             InfoAnakScreen(
//               dateInput: DateTime.now().subtract(Duration(days: 5)),
//               beratBadan: "11.0",
//               tinggiBadan: "82.0",
//             ),
//             InfoAnakScreen(
//               dateInput: DateTime.now().subtract(Duration(days: 9)),
//               beratBadan: "14.0",
//               tinggiBadan: "90.0",
//             ),
//             // Add more dummy data as needed
//           ],
//         ),
//       ),
//     ),
//   );
// }
