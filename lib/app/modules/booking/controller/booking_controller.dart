import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingController extends GetxController {
final RxList<Map<String, dynamic>> kecamatanList = <Map<String, dynamic>>[].obs;
RxString _selectedKecamatan = ''.obs;
  Future<void> fetchKecamatan() async {
    final response = await Supabase.instance.client
        .from('delevery_fee')
        .select('nama_kecamatan,fee');
  }

}