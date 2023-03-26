import 'package:flutter/material.dart';
import 'package:xflix/utils/text_modifie.dart';

class DescriptionPage extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, releaseDate;
  final double rating;
  const DescriptionPage(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.releaseDate,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191826),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 15,
                      child: TextModifie(
                          text: '     ⭐   Rating  $rating',
                          color: Colors.white,
                          size: 16))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextModifie(
                  text: name != null ? name : 'Not loading',
                  color: Colors.white,
                  size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: TextModifie(
                  text: 'Release Date :  $releaseDate',
                  color: Colors.white,
                  size: 15),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 250,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posterUrl)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextModifie(
                        text: description, color: Color(0xff868597), size: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
