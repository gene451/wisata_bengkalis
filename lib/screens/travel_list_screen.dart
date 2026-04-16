import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/travel_destination.dart';
import '../widgets/travel_card.dart';
import 'travel_detail_screen.dart';

class TravelListScreen extends StatelessWidget {
  const TravelListScreen({super.key});

  static List<TravelDestination> destinations = [
    TravelDestination(
      id: 1,
      name: 'Pantai Selat Baru',
      location: 'Bantan, Bengkalis, Riau',
      description:
          'Pantai Selat Baru di Kecamatan Bantan, Bengkalis, Riau, adalah destinasi wisata bahari unggulan yang berjarak sekitar 17 km atau 30-45 menit dari pusat Kota Bengkalis. Pantai ini populer dengan pemandangan Selat Malaka, pasir kuning, rimbunnya pohon kelapa, serta menjadi lokasi pesta pantai tahunan.',
      price: 5000,
      imagePath: 'assets/images/pantai_selat_baru.jpg',
      rating: 4.5,
    ),
    // Tambahkan Pantai Lapin dan Pantai Beting Aceh di sini...
    TravelDestination(
      id: 2,
      name: 'Pantai Beting Aceh',
      location: 'Rupat, Bengkalis, Riau',
      description:
          'Pulau Beting Aceh merupakan pulau kecil dengan luas sekitar dua hektar di Rupat Utara,  Kabupaten Bengkalis, Riau. Pulau Beting Aceh memiliki panorama indah dan unik, saat air laut surut pengunjung dapat melihat hamparan pasir putih yang dikelilingi lautan biru.',
      price: 10000,
      imagePath: 'assets/images/pantai_beting_aceh.jpg',
      rating: 4.5,
    ),
    TravelDestination(
      id: 3,
      name: 'Pantai lapin',
      location: 'Rupat, Bengkalis, Riau',
      description:
          'Pantai Lapin merupakan salah satu pantai wisata yang berada di Desa Selat Baru, Kecamatan Bantan, Kabupaten Bengkalis, Provinsi Riau. Pantai ini memiliki hamparan pasir yang luas menghadap langsung ke Selat Malaka. Suasananya tenang dengan deretan pohon kelapa di sepanjang pantai sehingga cocok untuk bersantai, menikmati angin laut, bermain pasir, serta melihat pemandangan matahari terbenam. Pantai ini juga sering menjadi tempat rekreasi masyarakat lokal dan pengunjung yang datang dari Kota Bengkalis.',
      price: 5000,
      imagePath: 'assets/images/pantai_lapin.jpeg',
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      // Kita hilangkan AppBar standar agar header bisa menyatu dengan body
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 20.h),

            // --- CUSTOM HEADER SECTION ---
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jelajahi Wisata",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3436),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Temukan keindahan alam di sekitar Anda",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),

                // Pembatas yang Menarik
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  height: 4.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),

            // --- DATA WISATA TERPOPULER SECTION ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Destinasi Populer",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("Lihat Semua")),
              ],
            ),
            SizedBox(height: 10.h),

            // --- LIST DATA WISATA ---
            // Karena kita di dalam ListView, kita gunakan Column + Map
            // atau builder manual agar tidak terjadi 'vertical viewport' error
            ...destinations.map((destination) {
              return TravelCard(
                destination: destination,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TravelDetailScreen(destination: destination),
                  ),
                ),
              );
            }).toList(),

            SizedBox(height: 20.h), // Padding bawah agar tidak mepet
          ],
        ),
      ),
    );
  }
}
