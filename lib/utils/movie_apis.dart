import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/movie_model.dart';

class MovieApi {
  static const String apiKey = 'b61a5f7b53d649d55ded0fe73ea496c7';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Fetch Trending Movies (Daily)
  static Future<List<Movie>> fetchTrendingMovies() async {
    final Uri uri = Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Movie>.from(
          data['results'].map((movieJson) => Movie.fromJson(movieJson)),
        );
      } else {
        throw Exception(
            'Failed to load trending movies. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching trending movies: $error');
    }
  }

  // Fetch Weekly Trending Movies
  static Future<List<Movie>> fetchWeeklyTrendingMovies() async {
    final Uri uri = Uri.parse('$baseUrl/trending/movie/week?api_key=$apiKey');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Movie>.from(
          data['results'].map((movieJson) => Movie.fromJson(movieJson)),
        );
      } else {
        throw Exception(
            'Failed to load weekly trending movies. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching weekly trending movies: $error');
    }
  }

  // Fetch Popular Movies
  static Future<List<Movie>> fetchPopularMovies() async {
    final Uri uri = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Movie>.from(
          data['results'].map((movieJson) => Movie.fromJson(movieJson)),
        );
      } else {
        throw Exception(
            'Failed to load popular movies. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching popular movies: $error');
    }
  }

  // Fetch Now Playing Movies
  static Future<List<Movie>> fetchNowPlayingMovies() async {
    final Uri uri = Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Movie>.from(
          data['results'].map((movieJson) => Movie.fromJson(movieJson)),
        );
      } else {
        throw Exception(
            'Failed to load now playing movies. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching now playing movies: $error');
    }
  }

  // Fetch Upcoming Movies
  static Future<List<Movie>> fetchUpcomingMovies() async {
    final Uri uri = Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Movie>.from(
          data['results'].map((movieJson) => Movie.fromJson(movieJson)),
        );
      } else {
        throw Exception(
            'Failed to load upcoming movies. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching upcoming movies: $error');
    }
  }

  static Future<List<Movie>> fetchWhatpopstreaming() async {
    final Uri uri =
        Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=$apiKey');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Movie>.from(
          data['results'].map((movieJson) => Movie.fromJson(movieJson)),
        );
      } else {
        throw Exception(
            'Failed to load upcoming movies. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching upcoming movies: $error');
    }
  }
}
