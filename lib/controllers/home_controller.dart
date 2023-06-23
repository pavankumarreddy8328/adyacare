import 'dart:async';
import 'dart:developer';

import 'package:adyacare/controllers/controllers_export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends Controller {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  final RxBool _isBackOnline = false.obs;
  RxBool isDeviceConnected = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initConnectivity();
    _subscribeToConnectivityChanges();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _unsubscribeFromConnectivityChanges();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      isDeviceConnected.value = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected.value) {
        showNoInternetToast();
      }
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  Future<void> _subscribeToConnectivityChanges() async {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) async {
      if (!isDeviceConnected.value &&
          connectivityResult != ConnectivityResult.none) {
        _isBackOnline.value = true;
      }

      isDeviceConnected.value = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected.value) {
        showNoInternetToast();
      }

      //If the User came from offline to online.

      if (_isBackOnline.value) {
        Fluttertoast.showToast(
            msg: "Back to Online!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xFF9B51E0),
            textColor: Colors.white,
            fontSize: 16.0);
      }

      _isBackOnline.value = false;
    });
  }

  void _unsubscribeFromConnectivityChanges() {
    _connectivitySubscription.cancel();
  }

  void showNoInternetToast() {
    Fluttertoast.showToast(
        msg: "No Internet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF9B51E0),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
