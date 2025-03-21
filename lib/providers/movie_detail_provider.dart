import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailProvider with ChangeNotifier {
  static const String apiKey = 'b61a5f7b53d649d55ded0fe73ea496c7';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  YoutubePlayerController? _youtubePlayerController;
  String? _trailerUrl;
  bool _isPlaying = false;

  YoutubePlayerController? get youtubePlayerController =>
      _youtubePlayerController;
  String? get trailerUrl => _trailerUrl;
  bool get isPlaying => _isPlaying;

  void setPlaying(bool playing) {
    _isPlaying = playing;
    notifyListeners();
  }

  Future<void> fetchTrailer(int movieId) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final videos = data['videos']['results'] as List<dynamic>;
        final trailer = videos.firstWhere(
          (video) => video['type'] == 'Trailer',
          orElse: () => null,
        );

        if (trailer != null) {
          _trailerUrl = trailer['key'];
          _youtubePlayerController = YoutubePlayerController(
            initialVideoId: _trailerUrl!,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          );
        }
      } else {
        print('Failed to load trailer data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching trailer: $e');
    }
    notifyListeners();
  }

  void disposeController() {
    _youtubePlayerController?.dispose();
  }
}
