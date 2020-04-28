import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final modalRoute = ModalRoute.of(context);
    final themeOf = Theme.of(context);

    final mealId = modalRoute.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(text, style: themeOf.textTheme.title,)
      );
    }

    Widget buildContainer(Widget childWidget, double containerHeight) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: containerHeight,
        width: 350,
        child: childWidget,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 220,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) =>
                      Card(
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(selectedMeal.ingredients[index],
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                ), 200
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) =>
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )), 300),
          ],
        ),
      ),
    );
  }
}
