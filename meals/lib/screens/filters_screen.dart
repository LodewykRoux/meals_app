import 'package:flutter/material.dart';
import 'package:meals/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.filters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten']!;
    _vegetarian = widget.filters['vegetarian']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (_) {
                setState(() {
                  _glutenFree = _;
                });
              },
              subtitle: const Text('Only include gluten free meals'),
              title: const Text('Gluten Free'),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (_) {
                setState(() {
                  _vegetarian = _;
                });
              },
              subtitle: const Text('Only include vegetarian meals'),
              title: const Text('Vegetarian'),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (_) {
                setState(() {
                  _vegan = _;
                });
              },
              subtitle: const Text('Only include vegan meals'),
              title: const Text('Vegan'),
            ),
            SwitchListTile(
              value: _lactoseFree,
              onChanged: (_) {
                setState(() {
                  _lactoseFree = _;
                });
              },
              subtitle: const Text('Only include lactose free meals'),
              title: const Text('Lactose Free'),
            ),
          ],
        ))
      ]),
    );
  }
}
