import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Waktu extends StatefulWidget {
  @override
  _WaktuState createState() => _WaktuState();
}

class _WaktuState extends State<Waktu> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _inputTime;
  String? _convertedTimeWIT;
  String? _convertedTimeWITA;
  String? _convertedTimeLondon;
  String? _convertedTimeBeijing;
  String? _convertedTimeBerlin;
  String? _convertedTimeWashingtonDC;

  void _convertTime() {
    setState(() {
      try {
        _inputTime = DateFormat('HH:mm').parse(_controller.text);

        _convertedTimeWIT =
            DateFormat('HH:mm').format(_inputTime!.add(Duration(hours: 2)));
        _convertedTimeWITA =
            DateFormat('HH:mm').format(_inputTime!.add(Duration(hours: 1)));
        _convertedTimeLondon = DateFormat('HH:mm')
            .format(_inputTime!.subtract(Duration(hours: 6)));
        _convertedTimeBeijing =
            DateFormat('HH:mm').format(_inputTime!.add(Duration(hours: 1)));
        _convertedTimeBerlin = DateFormat('HH:mm')
            .format(_inputTime!.subtract(Duration(hours: 5)));
        _convertedTimeWashingtonDC = DateFormat('HH:mm')
            .format(_inputTime!.subtract(Duration(hours: 11)));
      } catch (e) {
        _inputTime = null;
        _convertedTimeWIT = null;
        _convertedTimeWITA = null;
        _convertedTimeLondon = null;
        _convertedTimeBeijing = null;
        _convertedTimeBerlin = null;
        _convertedTimeWashingtonDC = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Masukkan waktu dalam format HH:mm (24-jam):',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'WIB',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertTime,
              child: Text('Konversi'),
            ),
            SizedBox(height: 16.0),
            if (_inputTime != null) ...[
              Text(
                'Hasil konversi:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'WIT: $_convertedTimeWIT',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'WITA: $_convertedTimeWITA',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'London: $_convertedTimeLondon',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Beijing: $_convertedTimeBeijing',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Berlin: $_convertedTimeBerlin',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Washington DC: $_convertedTimeWashingtonDC',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
