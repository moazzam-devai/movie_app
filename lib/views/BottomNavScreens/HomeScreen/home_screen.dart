import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/utils/movie_apis.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:movie/views/SearchResultsScreen/search_results_screen.dart';
import 'package:movie/widgets/movies_listview_widget.dart';
import 'package:movie/widgets/search_bar_widget.dart';
import 'package:movie/widgets/shimmer_effect_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final _searchHint = 'Search the movie...';

  List<Movie> trendingMovies = [];
  List<Movie> weeklyTrendingMovies = [];

  bool isLoading = true;
  bool isWeeklyLoading = true;

  String? username;

  @override
  void initState() {
    super.initState();
    fetchTrendingMovies();
    fetchWeeklyTrendingMovies();
    _getStoredUserData();
  }

  // Fetch stored user data from SharedPreferences
  Future<void> _getStoredUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username'); // Get the stored username
    });
  }

  // Fetch trending movies
  Future<void> fetchTrendingMovies() async {
    try {
      final movies = await MovieApi.fetchTrendingMovies();
      setState(() {
        trendingMovies = movies;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching daily movies: $error');
    }
  }

  // Fetch weekly trending movies
  Future<void> fetchWeeklyTrendingMovies() async {
    try {
      final movies = await MovieApi.fetchWeeklyTrendingMovies();
      setState(() {
        weeklyTrendingMovies = movies;
        isWeeklyLoading = false;
      });
    } catch (error) {
      print('Error fetching weekly movies: $error');
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
            left: 0.w,
            right: 0.w,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      'Welcome,',
                      style: AppTextStyles.welcomehead(15),
                    ),
                    Text(
                      username != null ? '$username' : 'Loading...',
                      style: AppTextStyles.mainheadings(15),
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
                    Text('Trending', style: AppTextStyles.mainheadings(20)),
                    SizedBox(height: 10.h),
                    buildSection(
                      title: 'Today:',
                      isLoading: isLoading,
                      movies: trendingMovies,
                      listType: 'day',
                    ),
                    SizedBox(height: 10.h),
                    buildSection(
                      title: 'Week:',
                      isLoading: isWeeklyLoading,
                      movies: weeklyTrendingMovies,
                      listType: 'week',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable section builder widget
  Widget buildSection({
    required String title,
    required bool isLoading,
    required List<Movie> movies,
    required String listType, // Added the required listType parameter
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
              : buildMoviesList(movies, listType),
        ),
      ],
    );
  }
}
