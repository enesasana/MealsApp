import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegan = false;
  bool _vegetarian = false;
  bool _glutenFree = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(bool currentType, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentType,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(_vegan, 'Vegan', 'Only includes vegan meals', (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(_vegetarian, 'Vegetarian', 'Only includes vegetarian meals', (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(_glutenFree, 'Gluten-Free', 'Only includes gluten-free meals', (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },),
                  _buildSwitchListTile(_lactoseFree, 'Lactose-Free', 'Only includes lactose-free meals', (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
