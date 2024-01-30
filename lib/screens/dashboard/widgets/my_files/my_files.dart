import 'package:SiBunga/models/FetchDataPertumbuhan.dart';
import 'package:flutter/material.dart';

class InfoAnakScreen extends StatefulWidget {
  final DateTime dateInput;

  final String? beratBadan;
  final String? tinggiBadan;
  final String? lingkarKpl;
  final String? lingkarLgn;

  InfoAnakScreen({
    Key? key,
    required this.dateInput,
    this.beratBadan,
    this.tinggiBadan,
    this.lingkarKpl,
    this.lingkarLgn,
  }) : super(key: key);

  @override
  _InfoAnakScreenState createState() => _InfoAnakScreenState();
}

class _InfoAnakScreenState extends State<InfoAnakScreen> {
  late Future<List<ModelDataPertumbuhan>> ProfileDataFuture;

  @override
  void initState() {
    super.initState();
    ProfileDataFuture = fetchDataPertumbuhan();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FutureBuilder<List<ModelDataPertumbuhan>>(
          future: ProfileDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Loading indicator while data is being fetched
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text(
                  'No data available'); // Handle case when no data is available
            } else {
              List<ModelDataPertumbuhan> profileData = snapshot.data!;

              // Filter the list to get data for the specific date
              // Assuming you want the latest data, you can use the last element in the list
              ModelDataPertumbuhan latestData = profileData.first;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Column pertama: Berat Badan dan Tinggi Badan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextWithPadding(
                          'Berat Badan:', '${latestData.beratBadan} kg'),
                      SizedBox(height: 8.0),
                      buildTextWithPadding(
                          'Tinggi Badan:', '${latestData.tinggiBadan} cm'),
                    ],
                  ),
                  // Column kedua: Lingkar Kepala dan Lingkar Lengan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextWithPadding(
                          'Lingkar Kepala:', '${latestData.lingkarKpl} cm'),
                      SizedBox(height: 8.0),
                      buildTextWithPadding('Lingkar Lengan Atas:',
                          '${latestData.lingkarLgn} cm'),
                    ],
                  ),
                ],
              );
            }
          }),
    );
  }

  Widget buildTextWithPadding(String label, String? value) {
    value = value ?? 'kosong'; // Jika nilai null, ganti dengan "kosong"

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
