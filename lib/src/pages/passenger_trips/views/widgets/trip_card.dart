// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/passenger_trips_controller.dart';
//
// class TripCard extends GetView<PassengerTripsController> {
//   const TripCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final trip = controller.trip.value;
//       return Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         margin: const EdgeInsets.all(16),
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Header
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage(trip.driverAvatar),
//                     radius: 24,
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       trip.driverName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.right,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // مسیر
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text("مبدا: ${trip.startLocation}"),
//                   const SizedBox(height: 4),
//                   Text("مقصد: ${trip.endLocation}"),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // زمان‌ها
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text("زمان درخواست: ${trip.requestTime}"),
//                       Text("زمان شروع: ${trip.startTime}"),
//                       Text("زمان پایان: ${trip.endTime}"),
//                     ],
//                   ),
//                   const Text(
//                     "زمان ها",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // شماره‌ها
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text("شماره راننده: ${trip.driverPhone}"),
//                       Text("شماره مسافر: ${trip.passengerPhone}"),
//                       Text("شماره مسافر۲: ${trip.passengerPhone2}"),
//                     ],
//                   ),
//                   const Text(
//                     "شناسه ها",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // فاصله
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("${trip.distanceKm} کیلومتر"),
//                   const Text("کیلومتر سفر"),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // قیمت
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey.shade200,
//                   foregroundColor: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text("${trip.price.toStringAsFixed(0)} تومان"),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
