import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/models/FetchDataPertumbuhan.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BBdgnTB_chart extends StatefulWidget {
  @override
  State<BBdgnTB_chart> createState() => _BBdgnTB_chartState();
}

class _BBdgnTB_chartState extends State<BBdgnTB_chart> {
  late List<ModelDataPertumbuhan> dataPertumbuhanList;

  @override
  void initState() {
    super.initState();
    dataPertumbuhanList = [];
    // Call fetchDataPertumbuhan in initState to retrieve the data
    fetchData();
  }

  Future<void> fetchData() async {
    // Call fetchDataPertumbuhan function to retrieve growth data
    dataPertumbuhanList = await fetchDataPertumbuhan();

    // Sort the dataPertumbuhanList based on date in ascending order
    dataPertumbuhanList.sort((a, b) => a.date.compareTo(b.date));

    // Take the first 10 items
    dataPertumbuhanList = dataPertumbuhanList.take(10).toList();

    // Print the retrieved data to the debug console
    print('Retrieved Growth Data:');
    for (ModelDataPertumbuhan data in dataPertumbuhanList) {
      print('Date: ${data.date}');
      print('Berat Badan: ${data.beratBadan}');
      print('Tinggi Badan: ${data.tinggiBadan}');
      print('Lingkar Kepala: ${data.lingkarKpl}');
      print('Lingkar Lengan: ${data.lingkarLgn}');
      print('------------------------');
    }

    // Set state to trigger a rebuild with the fetched data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (dataPertumbuhanList.isEmpty) {
      return Center(
        child: Text('No growth data available'),
      );
    }

    // Extract beratBadan and tinggiBadan data from dataPertumbuhanList
    List<FlSpot> spots = dataPertumbuhanList.map((data) {
      double beratBadan = data.beratBadan ?? 0.0;
      double tinggiBadan = data.tinggiBadan ?? 0.0;
      return FlSpot(tinggiBadan, beratBadan);
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
                  titleText: 'Berat Badan (kg)',
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                bottomTitle: AxisTitle(
                  showTitle: true,
                  titleText: 'Tinggi Badan (cm)',
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
