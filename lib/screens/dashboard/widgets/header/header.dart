import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/models/FetchProfile.dart';
import 'package:SiBunga/screens/profil/profil_screen.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  // final List<ProfilAnak> profilAnakList;
  const Header({
    // required this.profilAnakList,
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late Future<ModelProfilAnak> ProfileAnakFuture;
  DateTime? birthDate;

  @override
  void initState() {
    super.initState();
    ProfileAnakFuture = fetchProfileAnak();
    fetchData();
  }

  Future<void> fetchData() async {
    ModelProfilAnak profileAnak = await ProfileAnakFuture;

    // Now you can use the 'tanggalLahir' from the profileAnak
    birthDate = profileAnak.tanggalLahir;
    print('Tanggal Lahir: ${profileAnak.tanggalLahir} ');
    // Set state to trigger a rebuild with the fetched data
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ModelProfilAnak>(
      future: ProfileAnakFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return Text('Error: ${snapshot.hasData}');
        } else {
          ModelProfilAnak profileData = snapshot.data!;
          String namaAnak = profileData.nama ?? '';

          // Calculate age in months (if needed for UI)
          double ageInMonths = 0;

          if (birthDate != null) {
            Duration ageDifference = DateTime.now().difference(birthDate!);
            ageInMonths =
                double.parse((ageDifference.inDays / 30).round().toString());
            print('$ageInMonths Bulan');
          } else {
            print('Tanggal lahir kosong, hßarap diisi');
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$namaAnak',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '${ageInMonths.isNaN ? "Belum diisi" : "$ageInMonths Bulan"}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ]),
              SizedBox(width: 20),
              ProfileCard(),
            ],
          );
        }
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context);
    return InkWell(
      onTap: () {
        // Navigasi ke halaman profil ketika container diklik
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                ProfilAnak(), // Gantilah dengan halaman profil Anda
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: sizes.defaultPaddingValue),
        padding: EdgeInsets.symmetric(
          horizontal: sizes.defaultPaddingValue,
          vertical: sizes.defaultPaddingValue / 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: AppColors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Image.asset(
              AppImages.profilePic,
              height: 35,
            ),
            SizedBox(width: sizes.defaultPaddingValue / 2),
            Text("Profil"),
          ],
        ),
      ),
    );
  }
}
