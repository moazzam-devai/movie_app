import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/utils/movie_apis.dart';
import 'package:movie/views/MovieDetailScreen/movie_detail_screen.dart';

Widget buildMoviesList(List<Movie> movies, String listType) {
  return ListView.builder(
    itemCount: movies.length,
    padding: EdgeInsets.zero,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      final movie = movies[index];
      final String imageUrl =
          'https://image.tmdb.org/t/p/w500${movie.posterPath}';
      String apiUrl;

      // Based on the list type, generate the correct API URL
      if (listType == 'day') {
        apiUrl =
            'https://api.themoviedb.org/3/trending/movie/day?api_key=${MovieApi.apiKey}';
      } else if (listType == 'week') {
        apiUrl =
            'https://api.themoviedb.org/3/trending/movie/week?api_key=${MovieApi.apiKey}';
      } else if (listType == 'popular') {
        apiUrl =
            'https://api.themoviedb.org/3/movie/popular?api_key=${MovieApi.apiKey}';
      } else if (listType == 'now_playing') {
        apiUrl =
            'https://api.themoviedb.org/3/movie/now_playing?api_key=${MovieApi.apiKey}';
      } else if (listType == 'upcoming') {
        apiUrl =
            'https://api.themoviedb.org/3/movie/upcoming?api_key=${MovieApi.apiKey}';
      } else if (listType == 'tv') {
        apiUrl =
            'https://api.themoviedb.org/3/tv/popular?api_key=${MovieApi.apiKey}';
      } else {
        apiUrl = '';
      }
      return GestureDetector(
        onTap: () {
          // Passing the movie and API URL to the MovieDetailScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MovieDetailScreen(movie: movie, apiUrl: apiUrl),
            ),
          );
          print('Movie Details: ${movie.toJson()}');
        },
        child: Row(
          children: [
            Container(
              height: 230.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(115, 119, 119, 120),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          height: 150.h,
                          width: 120.w,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(fontSize: 13.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              movie.releaseDate,
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5.h,
                    right: 5.w,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.r),
                          topLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      );
    },
  );
}
