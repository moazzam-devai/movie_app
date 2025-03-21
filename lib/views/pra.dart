// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart' as http;
// import 'package:movie/utils/text_styles.dart';
// import 'package:movie/widgets/movie_container_widget.dart';
// import 'package:movie/widgets/search_bar_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final _searchController = TextEditingController();
//   final _searchHint = 'Search the movie...';
//   @override
//   void initState() {
//     super.initState();
//     fetchTrendingMovies();
//   }

//   Future<void> fetchTrendingMovies() async {
//     const String apiUrl = 'https://api.themoviedb.org/3/trending/movie/day';
//     const String apiKey = 'b61a5f7b53d649d55ded0fe73ea496c7';
//     final Uri uri = Uri.parse('$apiUrl?api_key=$apiKey');

//     try {
//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         // Parsing and printing the JSON response
//         final data = jsonDecode(response.body);
//         print('***********API Response: $data');
//       } else {
//         print('Failed to fetch movies. Status Code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching movies: $error');
//     }
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset('assets/images/hbg.png', fit: BoxFit.cover),
//           ),
//           Positioned(
//             top: 0.h,
//             left: 0.w,
//             right: 0.w,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 60.h),
//                     Text('Welcome,', style: AppTextStyles.welcomehead(15)),
//                     Text('Muhammad Ali Tahir,',
//                         style: AppTextStyles.mainheadings(15)),
//                     SizedBox(height: 10.h),
//                     SearchBarWidget(
//                         controller: _searchController, hintText: _searchHint),
//                     SizedBox(height: 10.h),
//                     Text('Trending', style: AppTextStyles.mainheadings(20)),
//                     SizedBox(height: 10.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Today:', style: AppTextStyles.subheadings(15)),
//                         Text('See all', style: MovieNameStyle.moviedate(15)),
//                       ],
//                     ),
//                     SizedBox(height: 5.h),
//                     SizedBox(
//                       height: 190.h,
//                       child: Padding(
//                         padding: EdgeInsets.all(0.r),
//                         child: ListView.builder(
//                           itemCount: 5,
//                           padding: EdgeInsets.zero,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Row(
//                               children: [
//                                 ReusableWidgets.reusableContainer(
//                                   height: 180.h,
//                                   width: 120.w,
//                                   color:
//                                       const Color.fromARGB(115, 119, 119, 120),
//                                   borderRadius: BorderRadius.circular(10.r),
//                                   child: Stack(
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.r),
//                                             child: Image.asset(
//                                               'assets/images/banner2.jpg',
//                                               fit: BoxFit.cover,
//                                               height: 120.h,
//                                               width: 120.w,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 5.w),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text('Venom',
//                                                     style: MovieNameStyle
//                                                         .moviename(13)),
//                                                 Text('23-5-2024',
//                                                     style: MovieNameStyle
//                                                         .moviedate(13)),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Positioned(
//                                         bottom: 5.h,
//                                         right: 5.w,
//                                         child: ReusableWidgets.movieNumberBadge(
//                                             '43'),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10.w,
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
