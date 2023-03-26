import 'package:flutter/material.dart';
import 'package:xflix/description_sreen.dart';
import 'package:xflix/utils/text_modifie.dart';

class TopRatedPage extends StatelessWidget {
  final List toprated;
  TopRatedPage({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextModifie(
            text: 'Top Rated Movies',
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                    name: toprated[index]["title"] != null
                                        ? toprated[index]["title"]
                                        : "loading",
                                    description: toprated[index]['overview'],
                                    bannerUrl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            toprated[index]['backdrop_path'],
                                    posterUrl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            toprated[index]['poster_path'],
                                    releaseDate: toprated[index]['release_date']
                                        .toString(),
                                    rating: toprated[index]['vote_average'],
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
                                            toprated[index]['poster_path']))),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: TextModifie(
                                text: toprated[index]["title"] != null
                                    ? toprated[index]["title"]
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
