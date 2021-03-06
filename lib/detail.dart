import 'package:flutter/material.dart';
import 'package:recipe_app2/data.dart';
import 'package:recipe_app2/constants.dart';
import 'package:recipe_app2/data.dart';
import 'package:recipe_app2/shared.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextTitleVariation1(recipe.title),
                    buildTextSubTitleVariation1(recipe.description),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 310,
                padding: const EdgeInsets.only(left: 16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTextTitleVariation2("Nutritions", false),
                        const SizedBox(
                          height: 16,
                        ),
                        buildNutrition(recipe.calories, "Calories", "Kcal"),
                        const SizedBox(
                          height: 16,
                        ),
                        buildNutrition(recipe.carbo, "Carbo", "g"),
                        const SizedBox(
                          height: 16,
                        ),
                        buildNutrition(recipe.protein, "Protein", "g"),
                      ],
                    ),
                    Positioned(
                      right: -90,
                      child: Hero(
                        tag: recipe.image,
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(recipe.image),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextTitleVariation2("Ingredients", false),
                    buildTextSubTitleVariation1("2 cups pecans, divided"),
                    buildTextSubTitleVariation1(
                        "1 tablespoon unsalted butter, melted"),
                    buildTextSubTitleVariation1(
                        "1/4 teaspoon kosher salt, plus more"),
                    buildTextSubTitleVariation1(
                        "3 tablespoons fresh lemon juice"),
                    buildTextSubTitleVariation1("2 tablespoons olive oil"),
                    buildTextSubTitleVariation1("1/2 teaspoon honey"),
                    const SizedBox(
                      height: 16,
                    ),
                    buildTextTitleVariation2('Recipe preparation', false),
                    buildTextSubTitleVariation1("STEP 1"),
                    buildTextSubTitleVariation1(
                        "In a medium bowl, mix all the marinade ingredients with some seasoning. Chop the chicken into bite-sized pieces and toss with the marinade. Cover and chill in the fridge for 1 hr or overnight."),
                    buildTextSubTitleVariation1("STEP 2"),
                    buildTextSubTitleVariation1(
                        "In a large, heavy saucepan, heat the oil. Add the onion, garlic, green chilli, ginger and some seasoning. Fry on a medium heat for 10 mins or until soft."),
                    buildTextSubTitleVariation1("STEP 3"),
                    buildTextSubTitleVariation1(
                        "Add the spices with the tomato pur??e, cook for a further 2 mins until fragrant, then add the stock and marinated chicken. Cook for 15 mins, then add any remaining marinade left in the bowl. Simmer for 5 mins, then sprinkle with the toasted almonds. Serve with rice, naan bread, chutney, coriander and lime wedges, if you like."),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          icon: const Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 32,
          ),
          label: const Text(
            "Watch Video",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ));
  }

  Widget buildNutrition(int value, String title, String subTitle) {
    return Container(
      height: 60,
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [kBoxShadow]),
            child: Center(
              child: Text(
                value.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
