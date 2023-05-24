import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductController extends GetxController {
  // state untuk menyimpan data products
  RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
  RxString title ="All Product".obs;
    

  Future<void> getProducts(String type) async {
    if(type=="all"){
        final response = await Supabase.instance.client
        .from('products')
        .select('product_id, merk, type, name, urlImage');

        if (response != null) {
        // update state products dengan respons dari query
        products.addAll(response.cast<Map<String, dynamic>>());
      }
    }else{
      title = type.obs;
      final response = await Supabase.instance.client
          .from('products')
          .select('product_id, merk, type, name, urlImage')
          .eq('type', type);
      if (response != null) {
        // update state products dengan respons dari query
        products.addAll(response.cast<Map<String, dynamic>>());
      }
    }
  }

  
  

}