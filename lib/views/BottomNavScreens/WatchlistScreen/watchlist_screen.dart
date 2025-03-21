import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/utils/database_helper.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:movie/views/BottomNavScreens/WatchlistScreen/watch_list_details_screen.dart';

import '../../movie_api.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _watchlist = [];
  final List<Movie> _matchedMovies = [];

  @override
  void initState() {
    super.initState();
    _loadWatchlist();
  }

  Future<void> _loadWatchlist() async {
    final data = await _dbHelper.getAllMovies();
    setState(() {
      _watchlist = data;
    });

    final futures = _watchlist.map((movie) async {
      final apiSource = movie['api_source'];
      final movieId = movie['movieid'].toString();

      List<Movie> apiMovies = [];
      if (apiSource == MovieApi.fetchTrendingMoviesUri().toString()) {
        apiMovies = await MovieApi.fetchTrendingMovies();
      } else if (apiSource ==
          MovieApi.fetchWeeklyTrendingMoviesUri().toString()) {
        apiMovies = await MovieApi.fetchWeeklyTrendingMovies();
      } else if (apiSource == MovieApi.fetchPopularMoviesUri().toString()) {
        apiMovies = await MovieApi.fetchPopularMovies();
      } else if (apiSource == MovieApi.fetchNowPlayingMoviesUri().toString()) {
        apiMovies = await MovieApi.fetchNowPlayingMovies();
      } else if (apiSource == MovieApi.fetchUpcomingMoviesUri().toString()) {
        apiMovies = await MovieApi.fetchUpcomingMovies();
      } else if (apiSource == MovieApi.fetchWhatpopstreamingUri().toString()) {
        apiMovies = await MovieApi.fetchWhatpopstreaming();
      }

      _checkMovieIdMatch(apiMovies, movieId);
    });

    await Future.wait(futures);
  }

  void _checkMovieIdMatch(List<Movie> apiMovies, String movieId) {
    for (var movie in apiMovies) {
      if (movie.id.toString() == movieId) {
        setState(() {
          _matchedMovies.add(movie);
        });
      }
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
          Positioned(
            top: 0.h,
            left: 10.w,
            right: 10.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child:
                      Text('Watchlist', style: AppTextStyles.mainheadings(20)),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 650.h,
                  child: ListView.builder(
                    itemCount: _matchedMovies.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = _matchedMovies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WatchListDetailsScreen(movie: movie),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(115, 119, 119, 120),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  movie.posterPath != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                            fit: BoxFit.cover,
                                            height: 150.h,
                                            width: 120.w,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 50,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 150.h,
                                          width: 120.w,
                                          color: Colors.grey,
                                          child: const Center(
                                            child: Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, top: 10.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.originalTitle ?? 'N/A',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            movie.overview ?? 'N/A',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.white70,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            'Release Date: ${movie.releaseDate ?? 'N/A'}',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            movie.mediaType ?? 'N/A',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.white70,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              height: 30.h,
                                              width: 30.w,
                                              padding: EdgeInsets.all(5.r),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10.r),
                                                  topLeft:
                                                      Radius.circular(10.r),
                                                ),
                                              ),
                                              child: Text(
                                                movie.voteAverage
                                                    .toStringAsFixed(1),
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
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
