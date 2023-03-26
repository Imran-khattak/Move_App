import 'package:flutter/material.dart';
import 'package:xflix/description_sreen.dart';
import 'package:xflix/utils/text_modifie.dart';

class TredingMovies extends StatelessWidget {
  final List trending;
  TredingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextModifie(
            text: 'Trending Movies',
            color: Colors.white,
            size: 24,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                    name: trending[index]["title"] != null
                                        ? trending[index]["title"]
                                        : "loading",
                                    description: trending[index]['overview'],
                                    bannerUrl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            trending[index]['backdrop_path'],
                                    posterUrl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            trending[index]['poster_path'],
                                    releaseDate: trending[index]['release_date']
                                        .toString(),
                                    rating: trending[index]['vote_average'],
                                  )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500" +
                                            trending[index]['poster_path']))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: TextModifie(
                                text: trending[index]["title"] != null
                                    ? trending[index]["title"]
                                    : "loading",
                                color: Colors.white,
                                size: 14),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
