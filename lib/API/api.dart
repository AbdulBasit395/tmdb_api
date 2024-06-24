

import 'dart:convert';

import 'package:tmdb_api/API/api_key.dart';

import 'package:tmdb_api/screen/move_model.dart';

import 'package:http/http.dart' as http;


class Api {

  final upComingApiUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final PopularApiUrl = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final TopRatedApiUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  Future<List<Movie>> getUpComingMovies () async{
    final response =  await http.get(Uri.parse(upComingApiUrl));


    if (response.statusCode == 200){
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie)=>Movie.fromMap(movie)).toList();
      return movies;
    } else{
      throw Exception('failed to load upcoming movies');
    }
  } 
  Future <List<Movie>> getPopularMovies () async {
    final response =  await http.get(Uri.parse(PopularApiUrl));


    if (response.statusCode == 200){
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie)=>Movie.fromMap(movie)).toList();
      return movies;
    } else{
      throw Exception('failed to load upcoming movies');
    }
  }
  Future <List<Movie>> getTopRatedMovies () async {
    final response =  await http.get(Uri.parse(TopRatedApiUrl));


    if (response.statusCode == 200){
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie)=>Movie.fromMap(movie)).toList();
      return movies;
    } else{
      throw Exception('failed to load upcoming movies');
    }
  }
}