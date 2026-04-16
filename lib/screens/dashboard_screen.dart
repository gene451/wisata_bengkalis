import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/travel_destination.dart'; // Pastikan path model benar
import 'travel_list_screen.dart'; // Mengambil data destinations dari sini
import 'travel_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data dari static list di TravelListScreen
    final destinations = TravelListScreen.destinations;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              
              // --- HEADER SECTION ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Halo, Genesis!", 
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                      Text("Mau Liburan Ke Mana?",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    child: const Icon(Icons.notifications_none, color: Colors.blueAccent),
                  ),
                ],
              ),
              
              SizedBox(height: 25.h),
              
              // --- SEARCH BAR ---
              _buildSearchBar(),

              SizedBox(height: 25.h),
              
              // --- KATEGORI ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem("Pantai", Icons.beach_access),
                  _buildCategoryItem("Gunung", Icons.terrain),
                  _buildCategoryItem("Hutan", Icons.park),
                  _buildCategoryItem("Kuliner", Icons.restaurant),
                ],
              ),

              SizedBox(height: 30.h),
              
              // --- DESTINASI POPULER ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Destinasi Populer",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman list lengkap
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TravelListScreen()));
                    }, 
                    child: const Text("Lihat Semua")
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              // --- HORIZONTAL LIST (Dinamis dari Data URL Asli) ---
              SizedBox(
                height: 260.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final item = destinations[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TravelDetailScreen(destination: item)),
                        );
                      },
                      child: _buildPopularCard(item),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Search Bar
  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Cari destinasi impianmu...",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
          border: InputBorder.none,
          icon: const Icon(Icons.search, color: Colors.blueAccent),
        ),
      ),
    );
  }

  // Widget Category Item
  Widget _buildCategoryItem(String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5)],
          ),
          child: Icon(icon, color: Colors.blueAccent, size: 28.sp),
        ),
        SizedBox(height: 8.h),
        Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }

  // Widget Card (Sudah disesuaikan dengan Model)
  Widget _buildPopularCard(TravelDestination destination) {
    return Container(
      width: 220.w,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              image: DecorationImage(
                image: AssetImage(destination.imagePath), // Menggunakan URL/Path asli dari model
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destination.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(destination.location, 
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 4.w),
                        Text(destination.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(
                      "Rp ${destination.price}",
                      style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 13.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}