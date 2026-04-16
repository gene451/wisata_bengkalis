import 'package:flutter/material.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import '../models/travel_destination.dart'; 
 
class TravelCard extends StatelessWidget { 
  final TravelDestination destination; 
  final VoidCallback onTap; 
 
  const TravelCard({super.key, required this.destination, required 
this.onTap}); 
 
  @override 
  Widget build(BuildContext context) { 
    return GestureDetector( 
      onTap: onTap, 
      child: Container( 
        margin: EdgeInsets.only(bottom: 15.h), 
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(15.r), 
          color: Colors.white, 
          boxShadow: [ 
            BoxShadow(color: Colors.black12, blurRadius: 10.r, offset: 
const Offset(0, 5)) 
          ], 
        ), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [ 
            ClipRRect( 
              borderRadius: BorderRadius.vertical(top: 
Radius.circular(15.r)), 
              child: Image.asset( 
                destination.imagePath, 
                height: 180.h, 
                width: double.infinity, 
                fit: BoxFit.cover, 
              ), 
            ), 
            Padding( 
              padding: EdgeInsets.all(12.w), 
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [ 
                  Text( 
                    destination.name, 
                    style: TextStyle(fontSize: 18.sp, fontWeight: 
FontWeight.bold), 
                  ), 
                  SizedBox(height: 4.h), 
                  Row( 
                    children: [ 
                      Icon(Icons.location_on, size: 14.sp, color: 
Colors.redAccent), 
                      SizedBox(width: 4.w), 
                      Text(destination.location, style: 
TextStyle(fontSize: 12.sp, color: Colors.grey)), 
                    ], 
                  ), 
                ], 
              ), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 