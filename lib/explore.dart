import 'package:flutter/material.dart';
import 'package:recipe_app2/constants.dart';
import 'package:recipe_app2/data.dart';
import 'package:recipe_app2/shared.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<bool> optionSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: const Icon(
          Icons.sort,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildTextTitleVariation1("Spring Salad"),
              buildTextSubTitleVariation1(
                  "Healthy and nutritious food recipes"),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  option('Vegetarian', 'assets/icons/salad.png', 0),
                  const SizedBox(
                    width: 8,
                  ),
                  option('Rice', 'assets/icons/rice.png', 1),
                  const SizedBox(
                    width: 8,
                  ),
                  option('Fruit', 'assets/icons/fruit.png', 2),
                ],
              )
            ]),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 350,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildRecipes(),
            ),
          )
        ]),
      ),
    );
  }

  Widget option(String text, String image, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        optionSelected[index] = !optionSelected[index];
      }),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          boxShadow: [kBoxShadow],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          SizedBox(
            height: 32,
            width: 32,
            child: Image.asset(
              image,
              color: optionSelected[index] ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: optionSelected[index] ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ),
    );
  }

  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildRecipe(getRecipes()[i], i));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [kBoxShadow],
      ),
      margin: EdgeInsets.only(
          right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
      padding: const EdgeInsets.all(16),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Hero(
                  tag: recipe.image,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(recipe.image), fit: BoxFit.contain),
                    ),
                  ))),
          const SizedBox(height: 8),
          buildRecipeTitle(recipe.title),
          buildTextSubTitleVariation2(recipe.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCalories(recipe.calories.toString() + " Kcal"),
            ],
          )
        ],
      ),
    );
  }
}
