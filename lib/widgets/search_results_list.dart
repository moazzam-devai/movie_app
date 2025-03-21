// lib/widgets/search_results_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'movie_card.dart';

class SearchResultsList extends StatelessWidget {
  final List<dynamic> results;
  const SearchResultsList({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final movie = results[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: MovieCard(movie: movie),
        );
      },
    );
  }
}
