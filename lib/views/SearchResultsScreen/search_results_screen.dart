// lib/screens/search_results_screen.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:movie/widgets/search_results_header.dart';
import 'package:movie/widgets/search_results_list.dart';
import 'package:movie/widgets/shimmer_effect_widget.dart';

class SearchResultsScreen extends StatefulWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  static const String apiKey = 'b61a5f7b53d649d55ded0fe73ea496c7';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  List<dynamic> results = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSearchResults(widget.query);
  }

  Future<void> _fetchSearchResults(String query) async {
    final url = Uri.parse('$baseUrl/search/multi').replace(queryParameters: {
      'api_key': apiKey,
      'query': query,
    });

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          results = data['results'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load search results');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/hbg.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            left: 0.w,
            right: 0.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  SearchResultsHeader(query: widget.query),
                  SizedBox(height: 10.h),
                  isLoading
                      ? const ShimmerLoading()
                      : results.isEmpty
                          ? const Center(
                              child: Text(
                                'No results found',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Expanded(
                              child: SearchResultsList(results: results),
                            ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.red,
              child: SvgPicture.asset(
                'assets/icons/homeicon.svg',
                width: 30.w,
                height: 30.h,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
