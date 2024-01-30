import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ModelProfilAnak {
  final String? nama;
  final String? tempatLahir;
  final DateTime? tanggalLahir;
  final int? umur;
  final String? nik;
  final String? jenisKelamin;
  final String? alamat;
  final String? namaIbu;
  final String? namaBapak;
  final String? nomorHp;
  final String? posyandu;
  final String? paud;
  final String? alergi;
  final String? golDarah;

  List<String> kepala = [];
  List<String> rambut = [];
  List<String> mata = [];
  List<String> hidung = [];
  List<String> telinga = [];
  List<String> rggMulut = [];
  List<String> gigi = [];
  List<String> bibir = [];
  List<String> tenggorokan = [];
  List<String> leher = [];
  List<String> dada = [];
  List<String> tangan = [];
  List<String> alatKlmn = [];

  ModelProfilAnak({
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.umur,
    this.nik,
    this.jenisKelamin,
    this.alamat,
    this.namaIbu,
    this.namaBapak,
    this.nomorHp,
    this.posyandu,
    this.paud,
    this.alergi,
    this.golDarah,
    required this.kepala,
    required this.rambut,
    required this.mata,
    required this.hidung,
    required this.telinga,
    required this.rggMulut,
    required this.gigi,
    required this.bibir,
    required this.tenggorokan,
    required this.leher,
    required this.dada,
    required this.tangan,
    required this.alatKlmn,
  });

  // tanggalLahir = tanggalLahir ?? DateTime.now();
}

Future<ModelProfilAnak> fetchProfileAnak() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String uid = user.uid;
    DocumentSnapshot profileSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (profileSnapshot.exists) {
      Map<String, dynamic> profileData =
          profileSnapshot.data() as Map<String, dynamic>;
      print('Profile Data from Firestore: $profileData');

      return ModelProfilAnak(
        nama: profileData['nama'] as String? ?? 'Belum diisi',
        tempatLahir: profileData['tempatLahir'] as String?,
        tanggalLahir: (profileData['tanggalLahir'] as Timestamp?)?.toDate(),
        nik: profileData['nik'] as String? ?? 'Belum diisi',
        jenisKelamin: (profileData['jenisKelamin'] as String?) ?? 'Belum diisi',
        alamat: profileData['alamat'] as String? ?? 'Belum diisi',
        namaIbu: profileData['namaIbu'] as String? ?? 'Belum diisi',
        namaBapak: profileData['namaBapak'] as String? ?? 'Belum diisi',
        nomorHp: profileData['nomorHp'] as String? ?? 'Belum diisi',
        posyandu: profileData['posyandu'] as String? ?? 'Belum diisi',
        paud: profileData['paud'] as String? ?? 'Belum diisi',
        alergi: profileData['alergi'] as String? ?? 'Belum diisi',
        golDarah:
            profileData['golDarah'] as String? ?? 'Golongan Darah Belum diisi',
        kepala: List<String>.from(profileData['Kepala'] ?? []),
        rambut: List<String>.from(profileData['Rambut'] ?? []),
        mata: List<String>.from(profileData['Mata'] ?? []),
        hidung: List<String>.from(profileData['Hidung'] ?? []),
        telinga: List<String>.from(profileData['Telinga'] ?? []),
        rggMulut: List<String>.from(profileData['Rongga Mulut'] ?? []),
        gigi: List<String>.from(profileData['Gigi'] ?? []),
        bibir: List<String>.from(profileData['Bibir dan Lidah'] ?? []),
        tenggorokan: List<String>.from(profileData['Tenggorokan'] ?? []),
        leher: List<String>.from(profileData['Leher'] ?? []),
        dada: List<String>.from(profileData['Dada'] ?? []),
        tangan:
            List<String>.from(profileData['Tangan & Kuku, Kaki & Kuku'] ?? []),
        alatKlmn: List<String>.from(profileData['Alat Kelamin'] ?? []),
      );
    }
  }

  // Return a default HealthHistory object or handle error as needed
  return ModelProfilAnak(
    nama: '',
    tempatLahir: '',
    // tanggalLahir: null,
    umur: null,
    nik: '',
    jenisKelamin: '',
    alamat: '',
    namaIbu: '',
    namaBapak: '',
    nomorHp: '',
    posyandu: '',
    paud: '',
    alergi: '',
    golDarah: '',
    kepala: [], // Default empty list
    rambut: [],
    mata: [],
    hidung: [],
    telinga: [],
    rggMulut: [],
    gigi: [],
    bibir: [],
    tenggorokan: [],
    leher: [],
    dada: [],
    tangan: [],
    alatKlmn: [], // Default empty list
    // ... (default empty lists for other properties)
  );
}
