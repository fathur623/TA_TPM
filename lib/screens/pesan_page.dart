import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_tpm/screens/login_page.dart';
import 'package:ta_tpm/screens/home_page.dart';
import 'package:ta_tpm/screens/konversi_uang_page.dart';
import 'package:ta_tpm/screens/konversi_waktu_page.dart';

class Pesan extends StatefulWidget {
  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 64.0),
            Text(
              'Kesan dan Saran',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 64.0),
            Text(
              'Kesan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kesan dari mata kuliah ini menurut saya merupakan mata kuliah yang cukup menyenangkan, karena pak Bagus sendiri tidak terlalu kaku dan bisa diajak bercanda. Namun sedikit menyebalkan terkait tugas, karena tingkat keseulitan yang cukup tinggi menurut saya dan waktunya yang bertabrakan dengan tugas-tugas dari mata kuliah yang lain. Walaupun hal ini idilakukan untuk menenmpuh batas maksimal dari mahasiswa, hanya saja waktu nya yang sepertinya tidak bersahabat karena banyak nya tugas akhir yang memiliki tenggat waktu yang sama.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Saran:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Pesan saya untuk pak Bagus adalah, tetap semangat pak.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Uang()),
                    );
                  },
                  child: Text('Konversi Mata Uang'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Waktu()),
                    );
                  },
                  child: Text('Konversi Waktu'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
          } else if (index == 2) {
            _handleLogout();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }

  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Aplikasi TA',
    home: HomePage(),
    routes: {
      '/konversi_mata_uang': (context) => Uang(),
      '/konversi_waktu': (context) => Waktu(),
    },
  ));
}
