import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddDestinationScreen extends StatefulWidget {
 const AddDestinationScreen({super.key});
 @override
 State<AddDestinationScreen> createState() =>
_AddDestinationScreenState();
}
class _AddDestinationScreenState extends State<AddDestinationScreen> {
 String _selectedCategory = 'Pantai';
 final List<String> _categories = ['Pantai', 'Gunung'];
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 backgroundColor: Colors.white,
 appBar: AppBar(
 title: Text(
 "Tambah Destinasi",
 style: TextStyle(
 color: Colors.black,
 fontSize: 18.sp,
 fontWeight: FontWeight.bold,
 ),
 ),
 backgroundColor: Colors.white,
 elevation: 0,
 leading: IconButton(
 icon: const Icon(Icons.arrow_back, color: Colors.black),
 onPressed: () => Navigator.pop(context),
 ),
 ),
 body: SingleChildScrollView(
 padding: EdgeInsets.all(20.w),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 // --- INPUT UNGGAH GAMBAR ---
 Text(
 "Foto Destinasi",
 style: TextStyle(fontSize: 14.sp, fontWeight:
FontWeight.bold),
 ),
 SizedBox(height: 10.h),
 Container(
 height: 180.h,
 width: double.infinity,
 decoration: BoxDecoration(
 color: Colors.grey[100],
 borderRadius: BorderRadius.circular(15.r),
 border: Border.all(
 color: Colors.grey[300]!,
 style: BorderStyle.solid,
 ),
 ),
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 Icon(
 Icons.add_a_photo_outlined,
 size: 40.sp,
 color: Colors.grey,
 ),
 SizedBox(height: 8.h),
 Text(
 "Klik untuk unggah foto",
 style: TextStyle(color: Colors.grey, fontSize: 12.sp),
 ),
 ],
 ),
 ),
 SizedBox(height: 25.h),
 // --- NAMA DESTINASI ---
 _buildInputField(
 "Nama Destinasi",
 "Contoh: Pantai Selat Baru",
 Icons.map_outlined,
 ),
 // --- LOKASI ---
 _buildInputField(
 "Lokasi",
 "Contoh: Bantan, Bengkalis",
 Icons.location_on_outlined,
 ),
 // --- DROPDOWN KATEGORI ---
 Text(
 "Kategori",
 style: TextStyle(fontSize: 14.sp, fontWeight:
FontWeight.bold),
 ),
 SizedBox(height: 10.h),
 Container(
 padding: EdgeInsets.symmetric(horizontal: 12.w),
 decoration: BoxDecoration(
 color: Colors.grey[50],
 borderRadius: BorderRadius.circular(12.r),
 border: Border.all(color: Colors.grey[200]!),
 ),
 child: DropdownButtonHideUnderline(
 child: DropdownButton<String>(
 value: _selectedCategory,
 isExpanded: true,
 items: _categories.map((String val) {
 return DropdownMenuItem<String>(
 value: val,
 child: Text(val),
 );
 }).toList(),
 onChanged: (value) {
 setState(() => _selectedCategory = value!);
 },
 ),
 ),
 ),
 SizedBox(height: 20.h),
 // --- DESKRIPSI ---
 Text(
 "Deskripsi",
 style: TextStyle(fontSize: 14.sp, fontWeight:
FontWeight.bold),
 ),
 SizedBox(height: 10.h),
 TextField(
 maxLines: 4,
 decoration: InputDecoration(
 hintText: "Tuliskan cerita singkat tentang tempat ini...",
 fillColor: Colors.grey[50],
 filled: true,
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(12.r),
 borderSide: BorderSide(color: Colors.grey[200]!),
 ),
 enabledBorder: OutlineInputBorder(
 borderRadius: BorderRadius.circular(12.r),
 borderSide: BorderSide(color: Colors.grey[200]!),
 ),
 ),
 ),
 SizedBox(height: 40.h),
 // --- TOMBOL SIMPAN ---
 SizedBox(
 width: double.infinity,
 height: 55.h,
 child: ElevatedButton(
 onPressed: () {
 // Logika simpan data di sini
 ScaffoldMessenger.of(context).showSnackBar(
 const SnackBar(
 content: Text("Data destinasi berhasil disimpan!"),
 ),
 );
 },
 style: ElevatedButton.styleFrom(
 backgroundColor: Colors.black,
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(15.r),
 ),
 ),
 child: Text(
 "Simpan Destinasi",
 style: TextStyle(
 color: Colors.white,
 fontSize: 16.sp,
 fontWeight: FontWeight.bold,
 ),
 ),
 ),
 ),
 SizedBox(height: 20.h),
 ],
 ),
 ),
 );
 }
 // Widget Helper untuk Input Field
 Widget _buildInputField(String label, String hint, IconData icon) {
 return Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text(
 label,
 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
 ),
 SizedBox(height: 10.h),
 TextField(
 decoration: InputDecoration(
 hintText: hint,
 prefixIcon: Icon(icon, size: 20.sp),
 fillColor: Colors.grey[50],
 filled: true,
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(12.r),
 borderSide: BorderSide(color: Colors.grey[200]!),
 ),
 enabledBorder: OutlineInputBorder(
 borderRadius: BorderRadius.circular(12.r),
 borderSide: BorderSide(color: Colors.grey[200]!),
 ),
 ),
 ),
 SizedBox(height: 20.h),
 ],
 );
 }
}
