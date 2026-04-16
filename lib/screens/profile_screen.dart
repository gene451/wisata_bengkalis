import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_screen.dart'; // Add this import

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER & FOTO PROFIL ---
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 60.h, bottom: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        backgroundImage: const NetworkImage(
                          "https://uiavatars.com/api/?name=Mukhlis+Santoso",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Genesis Gilbert",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "genesisgilbert45@gmail.com",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            // --- MENU PENGATURAN ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Akun",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildMenuItem(Icons.person_outline, "Informasi Pribadi"),
                  _buildMenuItem(Icons.notifications_none, "Notifikasi"),
                  _buildMenuItem(Icons.security, "Keamanan"),
                  SizedBox(height: 20.h),
                  Text(
                    "Lainnya",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildMenuItem(Icons.help_outline, "Pusat Bantuan"),
                  _buildMenuItem(Icons.info_outline, "Tentang Aplikasi"),
                  SizedBox(height: 10.h),
                  // Tombol Keluar with dialog
                  ListTile(
                    onTap: () {
                      // Menampilkan dialog konfirmasi
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Keluar"),
                          content: const Text(
                            "Apakah Anda yakin ingin keluar dari aplikasi?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context), // Tutup dialog
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigasi ke Login dan hapus semua stack halaman sebelumnya
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                "Ya, Keluar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: const Icon(Icons.logout, color: Colors.red),
                    ),
                    title: Text(
                      "Keluar",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h), // Spasi agar tidak tertutup BottomBar
          ],
        ),
      ),
    );
  }

  // Helper Statistik (if you need it - currently not used)
  Widget _buildStatItem(String value, String label) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Helper Menu Item
  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
