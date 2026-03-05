import 'package:flutter/material.dart';
import 'package:flutter_ungdungdulich/widgets/TravelCard.dart';
class HomeScreen extends StatelessWidget {
  get centerTitle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/imgs/avatar.png'),
            ),
            const SizedBox(width: 10),
            const Text('Xin chào, Tú!',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Xử lý khi nhấn vào biểu tượng thông báo
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('Địa điểm du lịch hot nhất Việt Nam', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.green),),
          TravelCard(name: "Hạ Long Bay", location: "Quảng Ninh", imagePath: "assets/imgs/halongbay.png"),
          TravelCard(name: "Sầm Sơn", location: "Thanh Hóa", imagePath: "assets/imgs/samson.png"),
          TravelCard(name: "Đà Nẵng", location: "Đà Nẵng", imagePath: "assets/imgs/danang.png"),
        ],
      ),
    );
  }
}