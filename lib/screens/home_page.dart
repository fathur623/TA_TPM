import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_tpm/screens/login_page.dart';
import 'package:ta_tpm/screens/pesan_page.dart';
import 'package:ta_tpm/screens/liga_page.dart';
import 'package:ta_tpm/screens/konversi_uang_page.dart';
import 'package:ta_tpm/screens/konversi_waktu_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 128.0),
              Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Fathur Rahman Mahmuda',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                '123210146',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 64.0),
              Text(
                'Lahir tanggal 21 Juli 2003, Bengkalis, Riau. Hobi bermain musik. Salah ambil jurusan, karena dari hati pengennya ambil jurusan musik, tapi apa daya jika di adu dengan keinginan orang tua.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 64.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Liga()),
                  );
                },
                child: Text('Lihat Liga'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pesan()),
            );
          } else if (index == 2) {
            _handleLogout();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
