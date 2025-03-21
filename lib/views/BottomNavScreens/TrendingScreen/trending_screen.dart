import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/utils/movie_apis.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:movie/views/SearchResultsScreen/search_results_screen.dart';
import 'package:movie/widgets/movies_listview_widget.dart';
import 'package:movie/widgets/search_bar_widget.dart';
import 'package:movie/widgets/shimmer_effect_widget.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final _searchController = TextEditingController();
  final _searchHint = 'Search the movie...';
  List<Movie> popularMovies = [];
  bool isPopularLoading = true;
  List<Movie> nowPlayingMovies = [];
  bool isNowPlayingLoading = true;
  List<Movie> upcomingMovies = [];
  bool isUpcomingLoading = true;
  List<Movie> popularTvShows = [];
  bool isPopularTvLoading = true;
  List<Movie> whatpopstreaming = [];
  bool iswhatpopstreamingLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPopularMovies();
    fetchNowPlayingMovies();
    fetchUpcomingMovies();
    fetchWhatpopstreaming();
  }

  Future<void> fetchPopularMovies() async {
    try {
      final movies = await MovieApi.fetchPopularMovies();
      setState(() {
        popularMovies = movies;
        isPopularLoading = false;
      });
    } catch (error) {
      print('Error fetching popular movies: $error');
    }
  }

  Future<void> fetchNowPlayingMovies() async {
    try {
      final movies = await MovieApi.fetchNowPlayingMovies();
      setState(() {
        nowPlayingMovies = movies;
        isNowPlayingLoading = false;
      });
    } catch (error) {
      print('Error fetching now playing movies: $error');
    }
  }

  Future<void> fetchUpcomingMovies() async {
    try {
      final movies = await MovieApi.fetchUpcomingMovies();
      setState(() {
        upcomingMovies = movies;
        isUpcomingLoading = false;
      });
    } catch (error) {
      print('Error fetching upcoming movies: $error');
    }
  }

  Future<void> fetchWhatpopstreaming() async {
    try {
      final movies = await MovieApi.fetchWhatpopstreaming();
      setState(() {
        whatpopstreaming = movies;
        iswhatpopstreamingLoading = false;
      });
    } catch (error) {
      print('Error fetching upcoming movies: $error');
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Trending Movies:',
                        style: AppTextStyles.mainheadings(15)),
                  ),
                  SizedBox(height: 10.h),
                  SearchBarWidget(
                      onSubmitted: (query) {
                        if (query.isNotEmpty) {
                          _searchController.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchResultsScreen(query: query),
                            ),
                          );
                        }
                      },
                      controller: _searchController,
                      hintText: _searchHint),
                  SizedBox(height: 10.h),
                  Text('Latest Trailer', style: AppTextStyles.mainheadings(20)),
                  SizedBox(height: 10.h),
                  buildSection(
                    title: 'Popular:',
                    isLoading: isPopularLoading,
                    movies: popularMovies,
                    listType: 'popular', // Added listType
                  ),
                  SizedBox(height: 10.h),
                  buildSection(
                    title: 'Streaming:',
                    isLoading: isNowPlayingLoading,
                    movies: nowPlayingMovies,
                    listType: 'now_playing', // Added listType
                  ),
                  SizedBox(height: 10.h),
                  buildSection(
                    title: 'In Theaters:',
                    isLoading: isUpcomingLoading,
                    movies: upcomingMovies,
                    listType: 'upcoming', // Added listType
                  ),
                  SizedBox(height: 10.h),
                  Text('Whats Popular:', style: AppTextStyles.mainheadings(20)),
                  SizedBox(height: 10.h),
                  buildSection(
                    title: 'streaming:',
                    isLoading: iswhatpopstreamingLoading,
                    movies: whatpopstreaming,
                    listType: 'tv', // Added listType
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection({
    required String title,
    required bool isLoading,
    required List<Movie> movies,
    required String listType, // Added listType parameter
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.subheadings(15)),
            Text('See all', style: MovieNameStyle.moviedate(15)),
          ],
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 230.h,
          child: isLoading
              ? buildShimmerEffect()
              : buildMoviesList(movies, listType), // Pass listType here
        ),
      ],
    );
  }
}
