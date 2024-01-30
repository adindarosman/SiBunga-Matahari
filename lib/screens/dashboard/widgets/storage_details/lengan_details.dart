import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/models/FetchDataPertumbuhan.dart';
import 'package:SiBunga/models/FetchProfile.dart';
import 'package:SiBunga/screens/dashboard/widgets/my_files/my_files.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_chart/lengan_usia_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LenganUsia_details extends StatefulWidget {
  final List<ModelDataPertumbuhan> dataPertumbuhanList;
  const LenganUsia_details({
    Key? key,
    required this.dataPertumbuhanList,
  }) : super(key: key);

  @override
  State<LenganUsia_details> createState() => _LenganUsia_detailsState();
}

class _LenganUsia_detailsState extends State<LenganUsia_details> {
  final _dateFormat = DateFormat('dd/MM/yyyy');
  late List<ModelDataPertumbuhan> dataPertumbuhanList = [];
  late Future<ModelProfilAnak> ProfileAnakFuture;
  DateTime? birthDate;
  @override
  void initState() {
    super.initState();
    fetchData();
    ProfileAnakFuture = fetchProfileAnak();
  }

  Future<void> fetchData() async {
    // Call fetchGrowthData to retrieve growth data
    dataPertumbuhanList = await fetchDataPertumbuhan();

    ModelProfilAnak profileAnak = await ProfileAnakFuture;

    // Now you can use the 'tanggalLahir' from the profileAnak
    birthDate = profileAnak.tanggalLahir;
    print('Tanggal Lahir: ${profileAnak.tanggalLahir}');
    // Set state to trigger a rebuild with the fetched data
    setState(() {});
  }

  List<DataRow> get tableRows {
    return dataPertumbuhanList.map((data) {
      // Convert String to double for lingkarKpl
      double lingkarLgn = data.lingkarLgn ?? 0.0;

      // Calculate age in months
      Duration ageDifference = data.date.difference(birthDate!);
      double ageInMonths =
          double.parse((ageDifference.inDays / 30).round().toString());

      return DataRow(cells: [
        DataCell(Text(_dateFormat.format(data.date) ?? '')),
        DataCell(Text(lingkarLgn.toString())),
        DataCell(Text(ageInMonths.toString())), // Display age in months
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Lingkar Lengan Atas Sesuai Usia",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: sizes.defaultPaddingValue),
          LenganUsia(),
          SizedBox(height: sizes.defaultPaddingValue),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: const Color.fromARGB(255, 98, 98, 98),
                borderRadius: sizes.defaultBorderRadius),
            child: DataTable(
              headingRowHeight: 70,
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
                    "Lingkar\nLengan\nAtas(cm)",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Usia\n(bulan)",
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
