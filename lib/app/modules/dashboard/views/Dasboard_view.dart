import 'package:flutter/material.dart';
import 'package:services/app/routes/app_pages.dart';

class DashboardWidget extends StatelessWidget {
   DashboardWidget({Key? key}) : super(key: key);

  final List<Map<String, String>> products = [
  {
    'title': 'Air Conditioner',
    'image': 'assets/AC.png',
  },
  {
    'title': 'Stove',
    'image': 'assets/Stove.png',
  },
  {
    'title': 'Washing Machine',
    'image': 'assets/Washing.png',
  },
  // tambahkan produk lainnya sesuai kebutuhan
];

final List<Map<String, String>> technicians = [
  {
    'name': 'Amar Jodi',
    'city': 'Karawang',
    'expertise': 'Air Conditioer',
    'image': 'assets/Teknisi2.png',
  },
  {
    'name': 'Jane Smith',
    'city': 'Bandung',
    'expertise': 'Listrik',
    'image': 'assets/Teknisi1.png',
  },
  // tambahkan teknisi lainnya sesuai kebutuhan
];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    SizedBox(
      height: 300,
      child: Stack(
        children: [
          // Widget untuk menampilkan foto
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/HeadDashboar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Widget untuk menampilkan teks
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Text(
                    'Any Damage At home?\nContact Me',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 16),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '  Service',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.Welcome);
          },
          child: const Text(
            'Show All >>',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    ),
    // Widget untuk menampilkan ListView
    SizedBox(
      height: 180,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    products[index]['image']!,
                    width: 144,
                    height: 134,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  products[index]['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          );
        },
      ),
    ),
    const SizedBox(height: 10,),
    const Text(
          ' Chat Technicians',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10,),
    // Widget untuk menampilkan ListView
    ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection:Axis.vertical,
      shrinkWrap: true,
      itemCount: technicians.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Row(
            children: [
              // Widget untuk menampilkan gambar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    technicians[index]['image']!,
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Widget untuk menampilkan informasi
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${technicians[index]['name']!} - ${technicians[index]['city']!}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      technicians[index]['expertise']!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                        ElevatedButton(
  onPressed: () {
    // aksi yang ingin dilakukan ketika tombol ditekan
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),
  child: const Text(
    'Chat',
    style: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  ),
),
                      
                    ),
                  ],
                ),
            
            ],
          ),
        );
      },
    ),
  ],
),
);
  }
}