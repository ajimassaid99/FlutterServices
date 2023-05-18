import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  Future<void> register({
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required String address,
  }) async {
    final response = await Supabase.instance.client
        .from('user')
        .select('email')
        .eq('email', email);

    if (response.isNotEmpty) {
      // email sudah terdaftar, tampilkan pesan error
      Get.snackbar('Error', 'Email already registered');
      return;
    }

    await Supabase.instance.client.from('user').insert({
      'email': email,
      'password': password,
      'phone': phone,
      'tanggal_lahir': dateOfBirth,
      'alamat': address,
    });
    Get.snackbar('Berhasil', 'Email Terdaftar');
    Get.offAllNamed('/login');   
    // registration successful
  }
}