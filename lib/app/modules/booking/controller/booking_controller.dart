import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingController extends GetxController {
  final RxList<Map<String, dynamic>> kecamatanList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> teknisiList = <Map<String, dynamic>>[].obs;
  RxString type= ''.obs;
  RxInt selectedKecamatan = 0.obs;
  RxInt selectedTeknisi = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchKecamatan();
  }

  Future<void> fetchKecamatan() async {
    final response = await Supabase.instance.client.from('delevery_fee').select('nama_kecamatan,fee');
    kecamatanList.value = [];
    if (response.isNotEmpty) {
      kecamatanList.addAll(response.cast<Map<String, dynamic>>());
      selectedKecamatan.value = response[0]['fee'];
    }
  }

  Future<void> fetchTeknisi(String Type) async {
    final response = await Supabase.instance.client.from('teknisi').select('id,name').eq('skill', Type);
    teknisiList.value=[];
    if (response.isNotEmpty) {
      teknisiList.addAll(response.cast<Map<String, dynamic>>());
      selectedTeknisi.value = response[0]['id'];

    }
  }
}