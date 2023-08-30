import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/home_screen.dart';
import 'package:riverpod_practice/user.dart';

//Types of Providers
//1.Provider
//2.StateProvider

// final nameProvider = Provider((ref) => "Ike");
// final nameProvider = StateProvider<String?>((ref) => null);

final userProvider = StateNotifierProvider<UserNotifer, User>(
  (ref) => UserNotifer(
    User(name: "", age: 0),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Riverpod App',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: HomeScreen(),
    );
  }
}
