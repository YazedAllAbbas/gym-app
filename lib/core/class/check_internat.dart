// import 'dart:io';

// checkInternet() async {
//   try {
//     var result = await InternetAddress.lookup("google.com");
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
// }

import 'package:http/http.dart' as http;

Future<bool> checkInternet() async {
  try {
    final response = await http.get(Uri.parse('https://www.google.com'));
    return response.statusCode == 200;
  } catch (_) {
    return false;
  }
}
// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController {


//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectionStatus.value = result;
//     if (_connectionStatus.value == ConnectivityResult.none) {
//       Get.snackbar("the Internet", "${_connectionStatus.value}");
//     }
//   }

//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else {
//         return true;
//       }
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }

