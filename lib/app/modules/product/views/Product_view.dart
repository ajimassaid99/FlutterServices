import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../controllers/Product_controller.dart';

// ignore: must_be_immutable
class ProductView extends GetView<ProductController> {
  String type;
  ProductView({Key? key, required this.type}) : super(key: key);

  void initState() {
    controller.getProducts(this.type);
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widget untuk menampilkan foto dan teks
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  // Widget untuk menampilkan foto
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/HeadAc.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Widget untuk menampilkan teks
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return Text(
                              controller.title.value,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Widget untuk menampilkan judul halaman
            Obx(() {
              return Text(
                "List Of ${controller.title.value}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            // Widget untuk menampilkan daftar produk
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          // Widget untuk menampilkan foto produk
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product['urlImage'],
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Widget untuk menampilkan informasi produk
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  product['type'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Widget untuk menampilkan tombol "Beli"
                                ElevatedButton(
                                  onPressed: () async {
                                    final prefs = await SharedPreferences.getInstance();
                                    final userId = await prefs.getString('userId');
                                    if (context.mounted){  
                                      if (userId == null){
                                        Get.toNamed(Routes.EmptyUser);
                                      }
                                      else{
                                      Get.toNamed('${Routes.Booking}?product_id=${product["product_id"].toString()}&type=${product["type"]}');
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.black, // warna latar belakang
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 50), // padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          0), // border radius
                                    ),
                                  ),
                                  child: const Text('BOOKING'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
