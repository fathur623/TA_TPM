import 'package:flutter/material.dart';

class Uang extends StatefulWidget {
  @override
  _UangState createState() => _UangState();
}

class _UangState extends State<Uang> {
  final TextEditingController _controller = TextEditingController();

  final double _conversionRateUSD = 0.000071;
  final double _conversionRateEUR = 0.000059;
  final double _conversionRatePHP = 0.0038;
  final double _conversionRateCNY = 0.00051;
  final double _conversionRateMYR = 0.00029;

  double _convertedValueUSD = 0.0;
  double _convertedValueEUR = 0.0;
  double _convertedValuePHP = 0.0;
  double _convertedValueCNY = 0.0;
  double _convertedValueMYR = 0.0;

  void _convertCurrency() {
    setState(() {
      double input = double.tryParse(_controller.text) ?? 0.0;
      _convertedValueUSD = input * _conversionRateUSD;
      _convertedValueEUR = input * _conversionRateEUR;
      _convertedValuePHP = input * _conversionRatePHP;
      _convertedValueCNY = input * _conversionRateCNY;
      _convertedValueMYR = input * _conversionRateMYR;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
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
              'Masukkan jumlah dalam Rupiah:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Rupiah',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Konversi'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hasil konversi:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'USD: \$${_convertedValueUSD.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'EUR: €${_convertedValueEUR.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'PHP: ₱${_convertedValuePHP.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'CNY: ¥${_convertedValueCNY.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'MYR: RM${_convertedValueMYR.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
