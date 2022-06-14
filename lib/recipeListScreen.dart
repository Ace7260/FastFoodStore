import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ace_1/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0),
    Recipe(
        "Burger maison",
        "Par Irakoze Eddy Nobel",
        // "https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-jpg",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0),
    Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0),
    Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0),
    Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0),
    Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0),
    Recipe(
        "Pizza facile",
        "Par Irakoze Eddy Nobel",
        "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
        "Faire cuire dans une poêle les lardons et les champingnos. \nDans un bol,verserr la boite de concentré de tomate y \najouter un demi verre d'eau ensuite un carré de \nsucre(pour enlever l'acidité de la tomate) une pinceé de \nsel de poivre,et une pincée d'herbe de Provence.",
        false,
        0)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Recettes"),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Dismissible(
              key: Key(recipe.title),
              onDismissed: (direction) {
                setState(() {
                  recipes.removeAt(index);
                  //msg
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${recipe.title} Supprimé")));
                });
              },
              background: Container(color: Colors.red),
              child: RecipeItemWidget(recipe: recipe),
            );
          }),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(Object context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
