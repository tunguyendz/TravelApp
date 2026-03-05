import 'package:flutter/material.dart';
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
    final newVelocity = velocity * 0.5; 
    return super.createBallisticSimulation(position, newVelocity);
  }
}