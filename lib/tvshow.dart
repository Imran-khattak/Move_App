import 'package:flutter/material.dart';
import 'package:xflix/description_sreen.dart';
import 'package:xflix/utils/text_modifie.dart';

class TvPage extends StatelessWidget {
  final List tvlis;
  TvPage({super.key, required this.tvlis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextModifie(
            text: 'Tv Shows',
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
                itemCount: tvlis.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                    name: tvlis[index]["title"] != null
                                        ? tvlis[index]["title"]
                                        : "loading",
                                    description: tvlis[index]['overview'],
                                    bannerUrl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            tvlis[index]['backdrop_path'],
                                    posterUrl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            tvlis[index]['poster_path'],
                                    releaseDate:
                                        tvlis[index]['release_date'].toString(),
                                    rating: tvlis[index]['vote_average'],
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500" +
                                            tvlis[index]['backdrop_path']))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: TextModifie(
                                text: tvlis[index]["original_name"] != null
                                    ? tvlis[index]["original_name"]
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
