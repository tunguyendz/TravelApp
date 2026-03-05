import 'package:flutter/material.dart';
class TravelCard extends StatelessWidget {
  final String name;
  final String location;
  final String imagePath;

  TravelCard({required this.name, required this.location, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20), 
      
      // 2. Trang trí cái hộp
    decoration: BoxDecoration(
      color: Colors.white, // Nền trắng
      borderRadius: BorderRadius.circular(20), // Bo góc 20
      boxShadow: [
        BoxShadow(
          color: Colors.black12, // Màu bóng đen nhạt
          blurRadius: 10, // Độ nhòe
          spreadRadius: 2, // Độ lan
          offset: Offset(0, 5), // Đổ bóng xuống dưới
        ),
      ],
    ),
    
    // 3. QUAN TRỌNG: Dùng ClipRRect để cắt những phần thừa của ảnh
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Co lại vừa đủ nội dung
        children: [
          // PHẦN ẢNH
          Stack(
            children: [
              Image.asset(
                imagePath,
                height: 200, // Đặt chiều cao cố định cho ảnh đẹp
                width: double.infinity, // Rộng full bề ngang thẻ
                fit: BoxFit.cover, // Cắt ảnh cho vừa khung
              ),
              Positioned(
                top: 20, right: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(name, style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          
          // PHẦN CHỮ BÊN DƯỚI
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(location, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Icon(Icons.favorite_border, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}