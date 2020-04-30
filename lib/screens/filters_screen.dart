import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _vegan = false;
  bool _vegetarian = false;
  bool _glutenFree = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

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
          actions: <Widget>[
            IconButton(icon: Icon(Icons.check_circle), onPressed: () {
              final selectedFilters = {
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushReplacementNamed('/');
              // TODO Snackbar veya Toast mesajı eklenebilir
            }),
            SizedBox(width: 25),
          ],
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
