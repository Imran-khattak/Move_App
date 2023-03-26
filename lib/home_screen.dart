import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:xflix/top_rated.dart';
import 'package:xflix/trending.dart';
import 'package:xflix/tvshow.dart';
import 'package:xflix/utils/text_modifie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShow = [];

  final String endpoint = "eaaa8c4f5216f2f30cdb805d1a5d0d35";
  final String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYWFhOGM0ZjUyMTZmMmYzMGNkYjgwNWQxYTVkMGQzNSIsInN1YiI6IjY0MWFjMWExZjlhYTQ3MDA3ZmM0OGMwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iDhLcppFUHvu2q5Fzkq2SbxXL7H_Q_qp2yBPf6kGSFI";

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  getMovies() async {
    TMDB tmdbWihtCustomlogs = await TMDB(ApiKeys(endpoint, accessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWihtCustomlogs.v3.trending.getTrending();
    Map topresult = await tmdbWihtCustomlogs.v3.movies.getTopRated();
    Map tvShowsresult = await tmdbWihtCustomlogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingresult["results"];
      topRatedMovies = topresult["results"];
      tvShow = tvShowsresult["results"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191826),
        title: const TextModifie(
          text: '9xflix',
          color: Colors.white,
          size: 24,
        ),
      ),
      backgroundColor: const Color(0xff191826),
      body: ListView(
        children: [
          TvPage(
            tvlis: tvShow,
          ),
          TopRatedPage(
            toprated: topRatedMovies,
          ),
          TredingMovies(
            trending: trendingMovies,
          )
        ],
      ),
    );
  }
}
