import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/models/FetchDataPertumbuhan.dart';
import 'package:SiBunga/models/FetchProfile.dart';
import 'package:SiBunga/screens/dashboard/widgets/my_files/my_files.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class KepalaChart extends StatefulWidget {
  @override
  State<KepalaChart> createState() => _KepalaChartState();
}

class _KepalaChartState extends State<KepalaChart> {
  late List<ModelDataPertumbuhan> dataPertumbuhanList;
  late Future<ModelProfilAnak> ProfileAnakFuture;
  DateTime? birthDate;

  @override
  void initState() {
    super.initState();
    dataPertumbuhanList = [];
    // Call fetchDataPertumbuhan in initState to retrieve the data
    fetchData();
    ProfileAnakFuture = fetchProfileAnak();
  }

  Future<void> fetchData() async {
    // Call fetchDataPertumbuhan function to retrieve growth data
    dataPertumbuhanList = await fetchDataPertumbuhan();

    // Sort the dataPertumbuhanList based on date in ascending order
    dataPertumbuhanList.sort((a, b) => a.date.compareTo(b.date));

    // Take the first 10 items
    dataPertumbuhanList = dataPertumbuhanList.take(10).toList();

    // Get the profile data
    ModelProfilAnak profileAnak = await ProfileAnakFuture;

    // Now you can use the 'tanggalLahir' from the profileAnak
    birthDate = profileAnak.tanggalLahir;
    print('Tanggal Lahir: ${profileAnak.tanggalLahir}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Check if dataPertumbuhanList is empty
    if (dataPertumbuhanList.isEmpty) {
      return Center(
        child: Text('No growth data available'),
      );
    }

    List<FlSpot> spots = dataPertumbuhanList.map((data) {
      double lingkarKpl = data.lingkarKpl ?? 0.0;

      Duration ageDifference = data.date.difference(birthDate!);
      double ageInMonths =
          double.parse((ageDifference.inDays / 30).round().toString());

      return FlSpot(ageInMonths, lingkarKpl);
    }).toList();

    // Calculate the minimum and maximum values for x and y
    double minX =
        spots.map((spot) => spot.x).reduce((min, x) => x < min ? x : min);
    double maxX =
        spots.map((spot) => spot.x).reduce((max, x) => x > max ? x : max);
    double minY =
        spots.map((spot) => spot.y).reduce((min, y) => y < min ? y : min);
    double maxY =
        spots.map((spot) => spot.y).reduce((max, y) => y > max ? y : max);

// Calculate intervals based on the range of values
    double xInterval = (maxX - minX) / 8; // Adjust the divisor as needed
    double yInterval = (maxY - minY) / 5; // Adjust the divisor as needed
// Ensure that intervals are non-zero
    xInterval =
        xInterval <= 0 ? 5.0 : xInterval; // Set a default value if needed
    yInterval =
        yInterval <= 0 ? 5.0 : yInterval; // Set a default value if needed

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  colors: [AppColors.primaryColor],
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  interval: yInterval,
                  showTitles: true,
                  getTextStyles: (context, value) => const TextStyle(
                    color: Colors.black, // Warna teks sumbu y
                  ),
                ),
                bottomTitles: SideTitles(
                  interval: xInterval,
                  showTitles: true,
                  getTextStyles: (context, value) => const TextStyle(
                    color: Colors.black, // Warna teks sumbu x
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                horizontalInterval: 1.0,
                verticalInterval: 1.0,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey, // Warna garis horizontal grid
                    strokeWidth: 0.5,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.grey, // Warna garis vertical grid
                    strokeWidth: 0.5,
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              axisTitleData: FlAxisTitleData(
                leftTitle: AxisTitle(
                  showTitle: true,
                  titleText: 'Lingkar Kepala (cm)',
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                bottomTitle: AxisTitle(
                  showTitle: true,
                  titleText: 'Usia (bulan)',
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
