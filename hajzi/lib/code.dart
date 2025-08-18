// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// void main() {
//   runApp(const DogApp());
// }

// class DogApp extends StatelessWidget {
//   const DogApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DogPage(),
//     );
//   }
// }

// class DogPage extends StatefulWidget {
//   const DogPage({super.key});

//   @override
//   State<DogPage> createState() => _DogPageState();
// }

// class _DogPageState extends State<DogPage> {
//   String? Dogurl;
//   bool isLoading = false;

//   Future<void> fetchDogImage() async {
//     setState(() => isLoading = true);
//     try {
//       var response = await Dio().get('https://dog.ceo/api/breeds/image/random');
//       if (response.statusCode == 200 && response.data['status'] == "success") {
//         setState(() {
//           Dogurl = response.data['message'];
//         });
//       } else {
//         setState(() {
//           Dogurl = null;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         Dogurl = null;
//       });
//     }
//     setState(() => isLoading = false);
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchDogImage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: const Text("Dog")),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Dog Image
//             isLoading
//                 ? const CircularProgressIndicator()
//                 : Dogurl != null
//                 ? ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.network(
//                       Dogurl!,
//                       height: 300,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                 : const Text(
//                     "Failed to load dog ",
//                     style: TextStyle(fontSize: 18, color: Colors.redAccent),
//                   ),
//             const SizedBox(height: 30),

//             // Reload button
//             ElevatedButton.icon(
//               onPressed: fetchDogImage,
//               icon:  Icon(Icons.refresh),
//               label:  Text("New Dog"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 14,
//                 ),
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
