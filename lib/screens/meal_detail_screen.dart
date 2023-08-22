import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  const MealDetailScreen({super.key});

  Widget buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
      height: 150,
      width: 400,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Colors.amberAccent,
                child: Text(selectedMeal.ingredients[index]),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle("Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(child: Text('#${index + 1}'),),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider()
              ],),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
