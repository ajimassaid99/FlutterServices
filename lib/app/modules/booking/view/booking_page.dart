import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/app/modules/booking/view/pembayaran_page.dart';
import '../controller/booking_controller.dart';
import 'package:intl/intl.dart';

class BookingPage extends GetView<BookingController> {
  BookingPage({Key? key}) : super(key: key);

  final formatIDR = new NumberFormat.currency(
      locale: 'id_IDR', symbol: 'Rp ', decimalDigits: 0);
  final productId = Get.parameters['product_id'];
  final String productType = Get.parameters['type']!;
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addresController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime _selectedDate;
  final _dateController = TextEditingController();

  void initState() {
    controller.fetchTeknisi(productType).then((_) {
      // operasi lainnya
    });
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _dateController.text = DateFormat('dd MMM yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    initState();
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
                Obx(() {
                  return Column(
                    children: [
                      DropdownButtonFormField<int>(
                        decoration: const InputDecoration(
                          labelText: 'Kecamatan',
                        ),
                        value: controller.selectedKecamatan.value,
                        onChanged: (newValue) {
                          controller.selectedKecamatan.value = newValue!;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Kecamatan is required';
                          }
                          return null;
                        },
                        items: controller.kecamatanList.map((kecamatan) {
                          return DropdownMenuItem<int>(
                            value: kecamatan['fee'],
                            child: Text(kecamatan['nama_kecamatan']),
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
                      DropdownButtonFormField<int>(
                        decoration: const InputDecoration(
                          labelText: 'Teknisi',
                        ),
                        value: controller.selectedTeknisi.value,
                        onChanged: (newValue) {
                          controller.selectedTeknisi.value = newValue!;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Kecamatan is required';
                          }
                          return null;
                        },
                        items: controller.teknisiList.map((t) {
                          return DropdownMenuItem<int>(
                            value: t['id'],
                            child: Text(t['name']),
                          );
                        }).toList(),
                      ),
                      TextFormField(
                        controller: _amountController,
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
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: InputDecoration(
                          labelText: 'Date Booking',
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'Date is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Konfirmasi Booking'),
                                  content: Text(
                                      'Apakah Anda yakin ingin melakukan booking dengan biaya teknisi datang sebesar \n ${formatIDR.format(controller.selectedKecamatan.value)}? \n Biaya jasa service belum termasuk.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Batal'),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Ya, Lanjutkan'),
                                      onPressed: () async {
                                        await controller.Booking(
                                            product_id: int.parse(productId!),
                                            teknisi_id: controller
                                                .selectedTeknisi.value,
                                            address: _addresController.text,
                                            biaya: controller
                                                .selectedKecamatan.value,
                                                date: _dateController.text);
                                        if (context.mounted) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentSelectionView(),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
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
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
