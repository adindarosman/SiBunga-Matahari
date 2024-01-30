import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/models/FetchDataPertumbuhan.dart';
import 'package:SiBunga/screens/dashboard/widgets/header/header.dart';
import 'package:SiBunga/screens/dashboard/widgets/my_files/edit_info_screen.dart';
import 'package:SiBunga/screens/dashboard/widgets/my_files/my_files.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_details/berat_details.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_details/berattinggi_details.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_details/kepala_details.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_details/lengan_details.dart';
import 'package:SiBunga/screens/dashboard/widgets/storage_details/tinggi_details.dart';

import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Header(),
          SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
                    InfoAnakScreen(
                      dateInput: DateTime.now(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman EditInfoScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditInfoScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.grey, // Warna latar belakang oranye
                        minimumSize: Size(280.0, 30.0), // Lebar selebar halaman
                      ),
                      child: Text('Tambahkan Data Pertumbuhan'),
                    ),
                    SizedBox(height: 9.0),
                    BeratTinggi_details(
                      dataPertumbuhanList: [
                        ModelDataPertumbuhan(date: DateTime.now())
                      ],
                    ),
                    SizedBox(height: 10.0),
                    BeratUsia_details(
                      dataPertumbuhanList: [
                        ModelDataPertumbuhan(date: DateTime.now())
                      ],
                    ),
                    SizedBox(height: 10.0),
                    TinggiUsia_details(
                      dataPertumbuhanList: [
                        ModelDataPertumbuhan(date: DateTime.now())
                      ],
                    ),
                    SizedBox(height: 10.0),
                    KepalaUsia_details(
                      dataPertumbuhanList: [
                        ModelDataPertumbuhan(date: DateTime.now())
                      ],
                    ),
                    SizedBox(height: 10.0),
                    LenganUsia_details(
                      dataPertumbuhanList: [
                        ModelDataPertumbuhan(date: DateTime.now())
                      ],
                    ),
                    SizedBox(height: 10.0),
                    // RecentFiles(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(AppWidget());
}
