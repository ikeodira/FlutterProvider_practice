import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/main.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String userNo = "1";

  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserProvider(userNo)).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    userNo = value;
                  });
                },
              ),
              Center(
                child:
                    Text('My name is ${data.name} my email is ${data.email}'),
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text('Error'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(fetchUserProvider).when(
//       data: (data) {
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: [
//               Center(
//                 child:
//                     Text('My name is ${data.name} my email is ${data.email}'),
//               )
//             ],
//           ),
//         );
//       },
//       error: (error, stackTrace) {
//         return const Center(
//           child: Text('Error'),
//         );
//       },
//       loading: () {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
