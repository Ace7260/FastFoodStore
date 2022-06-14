// ignore_for_file: prefer_const_constructors

import 'package:ace_1/favoriteChangeNotifier.dart';
import 'package:ace_1/recipe.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'favoriteWidget.dart';

// ignore: use_key_in_widget_constructors
class RecipeScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //pour les aligner au début
              children: [
                Container(
                  // padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(
                  recipe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                )
              ],
            )),
            FavoriteIconWidget(),
            FavoriteTextWidget()
          ],
        ));
    Widget button = Container(
        padding: const EdgeInsets.all(8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _builColumn(Colors.blue, Icons.heat_pump_rounded, "LIKE"),
          _builColumn(Colors.blue, Icons.comment, "COMMENT"),
          _builColumn(Colors.blue, Icons.share, "SHARE"),
        ]));
    Widget descriptionSection = Container(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          recipe.description,
          softWrap: true,
        ),
      ),
    );

    return ChangeNotifierProvider(
      create: (context)=> FavoriteChangeNotifier(recipe.isFavorite,recipe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
              title: Text("Mes Recettes"), backgroundColor: Colors.transparent),
          body: ListView(children: [
            /*Stack(
                children: [
                  Container(
                    width: 600,
                    height: 240,
                    child: Center(child: CircularProgressIndicator()),
                  ),*/
    
            CachedNetworkImage(
              //'images/cherry.png',
              // placeholder: kTransparentImage,
              imageUrl: recipe.imageUrl,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            button,
            descriptionSection,
          ])),
    );
  }

  Column _builColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          // margin: EdgeInsets.only(bottom: 5),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        )
      ],
    );
  }
}
