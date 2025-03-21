import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie_model.dart';

class MovieApi {
  static const String apiKey = 'b61a5f7b53d649d55ded0fe73ea496c7';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Return Uri for trending movies (daily)
  static Uri fetchTrendingMoviesUri() {
    return Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey');
  }

  // Return Uri for weekly trending movies
  static Uri fetchWeeklyTrendingMoviesUri() {
    return Uri.parse('$baseUrl/trending/movie/week?api_key=$apiKey');
  }

  // Return Uri for popular movies
  static Uri fetchPopularMoviesUri() {
    return Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
  }

  // Return Uri for now playing movies
  static Uri fetchNowPlayingMoviesUri() {
    return Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey');
  }

  // Return Uri for upcoming movies
  static Uri fetchUpcomingMoviesUri() {
    return Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey');
  }

  // Return Uri for streaming (popstreaming) movies
  static Uri fetchWhatpopstreamingUri() {
    return Uri.parse('$baseUrl/tv/popular?api_key=$apiKey');
  }

  static Uri fetchtrendingpop() {
    return Uri.parse('$baseUrl/tv/popular?api_key=$apiKey');
  }

  // Fetch Trending Movies (Daily)
  static Future<List<Movie>> fetchTrendingMovies() async {
    final Uri uri = fetchTrendingMoviesUri();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(
        data['results'].map((movieJson) => Movie.fromJson(movieJson)),
      );
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  // Fetch Weekly Trending Movies
  static Future<List<Movie>> fetchWeeklyTrendingMovies() async {
    final Uri uri = fetchWeeklyTrendingMoviesUri();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(
        data['results'].map((movieJson) => Movie.fromJson(movieJson)),
      );
    } else {
      throw Exception('Failed to load weekly trending movies');
    }
  }

  // Fetch Popular Movies
  static Future<List<Movie>> fetchPopularMovies() async {
    final Uri uri = fetchPopularMoviesUri();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(
        data['results'].map((movieJson) => Movie.fromJson(movieJson)),
      );
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  // Fetch Now Playing Movies
  static Future<List<Movie>> fetchNowPlayingMovies() async {
    final Uri uri = fetchNowPlayingMoviesUri();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(
        data['results'].map((movieJson) => Movie.fromJson(movieJson)),
      );
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  // Fetch Upcoming Movies
  static Future<List<Movie>> fetchUpcomingMovies() async {
    final Uri uri = fetchUpcomingMoviesUri();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(
        data['results'].map((movieJson) => Movie.fromJson(movieJson)),
      );
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  // Fetch Popstreaming Movies
  static Future<List<Movie>> fetchWhatpopstreaming() async {
    final Uri uri = fetchtrendingpop();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(
        data['results'].map((movieJson) => Movie.fromJson(movieJson)),
      );
    } else {
      throw Exception('Failed to load popstreaming movies');
    }
  }
}
