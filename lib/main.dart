import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/home_screen.dart';
import 'package:riverpod_practice/user.dart';

//Types of Providers
//1.Provider
//2.StateProvider

// final nameProvider = Provider((ref) => "Ike");
// final nameProvider = StateProvider<String?>((ref) => null);

final fetchUserProvider = FutureProvider.family((ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});

final streamProvider = StreamProvider<int>((ref) async* {
  yield 1;
});

// final streamProvider = StreamProvider<List<int>>((ref) async* {
//   yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
// });

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
    return MaterialApp(
      title: 'Flutter Riverpod App',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
