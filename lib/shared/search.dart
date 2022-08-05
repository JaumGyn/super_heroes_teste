import 'package:flutter/material.dart';
import 'package:super_heroes/models/super_heroes_model.dart';
import 'package:super_heroes/shared/superhero.dart';

class HeroSearch extends SearchDelegate {
  final List<HeroItem> all;

  HeroSearch({required this.all});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, all);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var query1;
    var query2 = " ";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var search = all.where((hero) => hero.name!.contains(query2)).toList();

    return search.length == 0
        ? _buildProgressIndicator()
        : _buildSearchList(search);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var query1;
    var query2 = "";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var search;

    if (query2.isNotEmpty) {
      search = all.where((hero) => hero.name!.contains(query2)).toList();
    } else {
      search = all;
    }

    return search == null
        ? _buildProgressIndicator()
        : _buildSearchList(search);
  }

  _buildSearchList(List search) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: search.length == 0 ? 0 : search.length,
        itemBuilder: (BuildContext context, int position) {
          HeroItem? heroItem = search[position];

          return Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: SuperHero(
              heroItem: heroItem,
            ),
          );
        },
      ),
    );
  }

  _buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}
