import'package:flutter/material.dart';
Widget buildTravelCard(String name, String location, String imagePath) {
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
      borderRadius: BorderRadius.circular(20), // Phải bo trùng khớp với Container
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
            padding: EdgeInsets.all(15), // Cách lề trong
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
// Class này giúp giảm tốc độ cuộn
class SlowScrollPhysics extends ScrollPhysics {
  const SlowScrollPhysics({super.parent});

  @override
  SlowScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SlowScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // Đây là bí thuật: Giảm vận tốc đi một nửa (0.5)
    // Ông muốn chậm nữa thì giảm xuống 0.3, muốn nhanh hơn thì tăng lên 0.8
    final newVelocity = velocity * 0.2; 
    return super.createBallisticSimulation(position, newVelocity);
  }
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Ứng dụng Du Lịch')),

body: ListView(
   physics:SlowScrollPhysics(), // Thêm physics để giảm tốc độ cuộn
  padding: EdgeInsets.only(bottom: 20), // Cách đáy một chút cho đẹp
  children: [
    // Gọi thẻ số 1
    buildTravelCard("Hạ Long Bay", "Quảng Ninh", "assets/imgs/anhsongbien.png"),
    
    // Gọi thẻ số 2 (Tạm thời cứ dùng chung ảnh cũ, sau này ông thêm ảnh khác vào assets sau)
    buildTravelCard("Phú Quốc", "Kiên Giang", "assets/imgs/anhsongbien.png"),
    
    // Gọi thẻ số 3
    buildTravelCard("Đà Lạt", "Lâm Đồng", "assets/imgs/anhsongbien.png"),
    
    // Gọi thẻ số 4
    buildTravelCard("Sapa", "Lào Cai", "assets/imgs/anhsongbien.png"),
  ],
),
    ),
  ));
}