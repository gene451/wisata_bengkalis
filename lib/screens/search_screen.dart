import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchScreen extends StatefulWidget {
 const SearchScreen({super.key});
 @override
 State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
 final List<String> _recentSearches = [
 "Bengkalis",
 "Rupat",
 "Rupat Utara",
 "Bantan",
 ];
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 backgroundColor: const Color(0xFFF8F9FB),
 appBar: AppBar(
 backgroundColor: Colors.white,
 elevation: 0,
 title: Text(
 "Cari Destinasi",
 style: TextStyle(
 color: Colors.black,
 fontSize: 18.sp,
 fontWeight: FontWeight.bold,
 ),
 ),
 centerTitle: true,
 ),
 body: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 // --- KOLOM INPUT PENCARIAN ---
 Container(
 padding: EdgeInsets.all(20.w),
 color: Colors.white,
 child: Container(
 padding: EdgeInsets.symmetric(horizontal: 15.w),
 decoration: BoxDecoration(
 color: Colors.grey[100],
 borderRadius: BorderRadius.circular(12.r),
 ),
 child: TextField(
 autofocus: true,
 decoration: InputDecoration(
 hintText: "Cari Wisata...",
 hintStyle: TextStyle(fontSize: 14.sp),
 border: InputBorder.none,
 icon: const Icon(Icons.search, color:
Colors.blueAccent),
 ),
 ),
 ),
 ),
 Expanded(
 child: SingleChildScrollView(
 padding: EdgeInsets.symmetric(horizontal: 20.w),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 SizedBox(height: 20.h),
 // --- RECENT SEARCHES ---
 Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
 Text(
 "Pencarian Terakhir",
style: TextStyle(
 fontSize: 16.sp,
 fontWeight: FontWeight.bold,
 ),
 ),
 TextButton(
 onPressed: () {},
child: const Text(
 "Hapus",
style: TextStyle(color: Colors.redAccent),
 ),
 ),
 ],
 ),
 Wrap(
 spacing: 10.w,
 children: _recentSearches
 .map(
 (city) => Chip(
 label: Text(city),
 backgroundColor: Colors.white,
 side: BorderSide(color: Colors.grey[300]!),
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(10.r),
 ),
 ),
 )
 .toList(),
 ),
 SizedBox(height: 30.h),
 // --- REKOMENDASI TUJUAN ---
 Text(
 "Rekomendasi Untukmu",
 style: TextStyle(
 fontSize: 16.sp,
 fontWeight: FontWeight.bold,
 ),
 ),
 SizedBox(height: 15.h),
 _buildSearchSuggestion(
 "Pantai Selat Baru",
 "Bantan, Bengkalis",
 ),
 _buildSearchSuggestion(
 "Pantai Beting Aceh",
 "Rupat Utara, Bengkalis",
 ),
 ],
 ),
 ),
 ),
 ],
 ),
 );
 }
 // Widget Helper untuk List Saran
 Widget _buildSearchSuggestion(String title, String subtitle) {
 return Container(
 margin: EdgeInsets.only(bottom: 15.h),
 padding: EdgeInsets.all(12.w),
 decoration: BoxDecoration(
 color: Colors.white,
 borderRadius: BorderRadius.circular(15.r),
 boxShadow: [
 BoxShadow(
 color: Colors.black.withOpacity(0.02),
 blurRadius: 10,
 offset: const Offset(0, 4),
 ),
 ],
 ),
 child: Row(
 children: [
 Container(
 height: 50.h,
 width: 50.h,
 decoration: BoxDecoration(
 color: Colors.blueAccent.withOpacity(0.1),
 borderRadius: BorderRadius.circular(10.r),
 ),
 child: const Icon(Icons.location_on, color:
Colors.blueAccent),
 ),
 SizedBox(width: 15.w),
 Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text(
 title,
 style: TextStyle(fontWeight: FontWeight.bold, fontSize:
14.sp),
 ),
 Text(
 subtitle,
 style: TextStyle(color: Colors.grey, fontSize: 12.sp),
 ),
 ],
 ),
 const Spacer(),
 const Icon(Icons.arrow_forward_ios, size: 14, color:
Colors.grey),
 ],
 ),
 );
 }
}
