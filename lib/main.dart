// ignore_for_file: prefer_const_constructors
import 'package:ace_1/recipe.dart';
import 'package:ace_1/recipeListScreen.dart';
import 'package:ace_1/recipeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Projet Next',
      //  theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home:// RecipeListScreen()
      RecipeScreen(recipe:Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0)  ),
      
    );
  }
}


