import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_response.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> nowPlayingMovies = [];

  final urlm = 'api.themoviedb.org';
  final segmentoNowPlaying = '/3/movie/now_playing';
  final api_key = 'a60c8092d60c3a84b51bcf5ac7f13ae9';

  MovieProvider() {
    getMoviesByNowPlaying();
  }

  Future<String> getNowPlayingMovies() async {
    final url = Uri.https(urlm, segmentoNowPlaying, {'api_key': api_key});
    var response = await http.get(url);
    return response.body;
  }

  void getMoviesByNowPlaying() async {
    final resp = await getNowPlayingMovies();
    final data = convert.jsonDecode(resp) as Map<String, dynamic>;
    final nowPlayingResponse = MovieResponse.fromJson(data);
    nowPlayingMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
