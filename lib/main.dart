import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 142, 125),
        appBar: AppBar(
          title: Text('Mr.Art Toy'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            ),
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8), // เพิ่ม padding รอบรูปภาพ
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.brown, // สีของกรอบ
                width: 5, // ความหนาของกรอบ
              ),
              borderRadius: BorderRadius.circular(12), // ทำให้กรอบมีมุมโค้งมน
            ),
            child: Image.network('https://cdn.ennxo.com/content/uploads/1600/%E0%B8%84%E0%B8%AD%E0%B8%A5%E0%B9%80%E0%B8%A5%E0%B8%81%E0%B8%8A%E0%B8%B1%E0%B8%99-skullpanda-candy-monster-town-series_1.webp'), // ใส่รูปภาพ
          ),
        ),
      ),
    );
  }
}
