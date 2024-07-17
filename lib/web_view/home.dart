import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:web_app/network/error_screen.dart';
import 'package:web_app/web_view/home1.dart';

class home extends StatefulWidget {
  const home({
    Key? key,
  }) : super(key: key);
  @override
  State<home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<home> {
  //##########
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _action();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(
      () {
        _connectionStatus = result;
      },
    );
  }

  Future<void> _action() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Get.off(error_Screen());
    } else {
      Get.off(home1());
    }
  }

//##########
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 2),
          Text('Active connection types:',
              style: Theme.of(context).textTheme.headlineMedium),
          const Spacer(),
          ListView(
            shrinkWrap: true,
            children: List.generate(
              _connectionStatus.length,
              (index) => Center(
                child: Text(
                  _connectionStatus[index].toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
