import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingController extends GetxController {
  final RxList<Map<String, dynamic>> kecamatanList =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> teknisiList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> KerusakanList =
      <Map<String, dynamic>>[].obs;

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

  Future<void> fetchKerusakan(String type) async {
    final response = await Supabase.instance.client
        .from('kerusakan')
        .select('nama_kerusakan,id,biaya')
        .eq('product_type', type);
    KerusakanList.value = [];
    if (response.isNotEmpty) {
      KerusakanList.addAll(response.cast<Map<String, dynamic>>());
    }
  }

  Future<void> Booking(
      {required int product_id,
      required int teknisi_id,
      required String address,
      required int biaya,
      required String date,
      required int amount,
      required List<int> kerusakan_id}) async {
    final prefs = await SharedPreferences.getInstance();
    int user_id = int.parse(prefs.getString('userId')!);

    final id = await Supabase.instance.client
        .from('booking')
        .select('id')
        .order('id', ascending: false)
        .limit(1);

    await Supabase.instance.client.from('booking').insert({
      'product_id': product_id,
      'teknisi_id': teknisi_id,
      'user_id': user_id,
      'address': address,
      'biaya': biaya,
      'status': 'Menunggu Pembayaran',
      'Tanggal': date,
      'amount': amount,
    });

    final insertedId = id[0]['id'] + 1;
    print(kerusakan_id);

    // Insert booking_items for each kerusakan_id
    await Future.delayed(Duration(seconds: 2));
    for (int id = 0; id < kerusakan_id.length; id++) {
      print(id);
      await Supabase.instance.client.from('booking_items').insert({
        'booking_id': insertedId,
        'kerusakan_id': kerusakan_id[id],
      });
    }

    Get.snackbar('Berhasil', 'Booking Berhasil, ID: $insertedId');
  }
  int getBiayaById(int id) {
  final kerusakan = KerusakanList.firstWhere((element) => element['id'] == id);
  return kerusakan != null ? kerusakan['biaya'] : 0; // Biaya default jika tidak ditemukan
}

String getnameById(int id) {
  final kerusakan = KerusakanList.firstWhere((element) => element['id'] == id);
  return kerusakan != null ? kerusakan['nama_kerusakan'] : 0; // Biaya default jika tidak ditemukan
}

}
