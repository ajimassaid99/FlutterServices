import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/booking_controller.dart';

class BookingPage extends GetView<BookingController> {
    
    const BookingPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('BookingPage'),),
            body: Container(),
        );
    }
}