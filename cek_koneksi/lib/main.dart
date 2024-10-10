import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cek Koneksi",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isConnected;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isConnected = true;
    _initConnectivityStatus().then((_) {
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
        setState(() {
          isConnected = !result.contains(ConnectivityResult.none);
        });
      });
    });
  }

  Future<void> _initConnectivityStatus() async {
    final result = await _connectivity.checkConnectivity();
    setState(() {
      isConnected = result != ConnectivityResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connection Test App"),
        backgroundColor: const Color.fromARGB(255, 190, 220, 235),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            isConnected ? 'assets/connected.png' : 'assets/disconnected.png',
            key: ValueKey<bool>(isConnected),
            width: 200,
            height: 200,
          ),
          ),
      ),
    );
  }
}