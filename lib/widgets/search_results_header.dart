// lib/widgets/search_results_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultsHeader extends StatelessWidget {
  final String query;
  const SearchResultsHeader({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Search Results for "$query"',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
