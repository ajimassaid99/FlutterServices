import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/booking_controller.dart';

class BookingPage extends GetView<BookingController> {
  BookingPage({Key? key}) : super(key: key);

  final productType = Get.parameters['product_id'];
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addresController = TextEditingController();
  final _amountController = TextEditingController();
  
  

  final List<String> kecamatanList = [
  'Kecamatan 1',
  'Kecamatan 2',
  'Kecamatan 3',
  'Kecamatan 4',
];
  String _selectedKecamatan = 'Kecamatan 1';

  final List<String> teknisiList = [
  'Kaka',
  'Eneng',
  'Putri',
  'Andaresta',
];
  String _selectedTeknisi = 'Kaka';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Booking Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: _namaController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _phoneController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'No Telefon',
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'no Telepon is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Kecamatan',
                  ),
                  value: _selectedKecamatan,
                  onChanged: (newValue) {
                    _selectedKecamatan = newValue!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Kecamatan is required';
                    }
                    return null;
                  },
                  items: kecamatanList.map((kecamatan) {
                    return DropdownMenuItem<String>(
                      value: kecamatan,
                      child: Text(kecamatan),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _addresController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Addres',
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Addres is required';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Teknisi',
                  ),
                  value: _selectedTeknisi,
                  onChanged: (newValue1) {
                    _selectedTeknisi = newValue1!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Teknisi is required';
                    }
                    return null;
                  },
                  items: teknisiList.map((teknisi) {
                    return DropdownMenuItem<String>(
                      value: teknisi,
                      child: Text(teknisi),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _amountController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Jumlah Harus lebih Dari 0';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Perform some action here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Booking',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}