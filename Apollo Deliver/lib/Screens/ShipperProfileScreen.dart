// import 'package:flutter/material.dart';
// import 'package:apollodeliver/Models/Shipper.dart';
// import 'package:apollodeliver/Services/ApiService.dart';
// import 'package:apollodeliver/Services/AuthService.dart';
//
// class ShipperProfileScreen extends StatefulWidget {
//   @override
//   _ShipperProfileScreenState createState() => _ShipperProfileScreenState();
// }
//
// class _ShipperProfileScreenState extends State<ShipperProfileScreen> {
//   late ApiService apiService;
//   Shipper? shipper;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _initialize();
//   }
//
//   Future<void> _initialize() async {
//     final token = await getToken(); // Lấy token từ shared_preferences
//     if (token != null) {
//       apiService = ApiService(baseUrl: 'http://192.168.1.7:9999', token: token);
//       fetchShipper();
//     } else {
//       setState(() {
//         isLoading = false;
//         // Xử lý trường hợp không có token
//       });
//     }
//   }
//
//   Future<void> fetchShipper() async {
//     try {
//       // Thay thế 1 bằng ID thực tế của shipper
//       final fetchedShipper = await apiService.getShipper(1);
//       setState(() {
//         shipper = fetchedShipper;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       // Xử lý lỗi
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shipper Profile'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : shipper == null
//           ? Center(child: Text('Failed to load shipper data'))
//           : Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Name: ${shipper!.shipperName}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('Email: ${shipper!.email}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('Phone: ${shipper!.phoneNumber}', style: TextStyle(fontSize: 18)),
//             // Thêm các trường khác nếu cần
//           ],
//         ),
//       ),
//     );
//   }
// }
