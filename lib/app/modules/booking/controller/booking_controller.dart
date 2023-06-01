import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingController extends GetxController {
  final RxList<Map<String, dynamic>> kecamatanList =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> teknisiList = <Map<String, dynamic>>[].obs;
  RxString type = ''.obs;
  RxInt selectedKecamatan = 0.obs;
  RxInt selectedTeknisi = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchKecamatan();
  }

  Future<void> fetchKecamatan() async {
    final response = await Supabase.instance.client
        .from('delevery_fee')
        .select('nama_kecamatan,fee');
    kecamatanList.value = [];
    if (response.isNotEmpty) {
      kecamatanList.addAll(response.cast<Map<String, dynamic>>());
      selectedKecamatan.value = response[0]['fee'];
    }
  }

  Future<void> fetchTeknisi(String Type) async {
    final response = await Supabase.instance.client
        .from('teknisi')
        .select('id,name')
        .eq('skill', Type);
    teknisiList.value = [];
    if (response.isNotEmpty) {
      teknisiList.addAll(response.cast<Map<String, dynamic>>());
      selectedTeknisi.value = response[0]['id'];
    }
  }

  Future<void> Booking(
      {required int product_id,
      required int teknisi_id,
      required String address,
      required int biaya}) async {
    final prefs = await SharedPreferences.getInstance();
    int user_id = int.parse(prefs.getString('userId')!);

    await Supabase.instance.client.from('booking').insert({
      'product_id': product_id,
      'teknisi_id': teknisi_id,
      'user_id': user_id,
      'addres': address,
      'biaya': biaya,
      'status':'Menunggu Pembayaran'
    });
    Get.snackbar('Berhasil', 'Booking Berhasil');
    // registration successful
  }
}
