import 'package:flutter/material.dart';
import 'package:super_heroes/models/super_heroes_model.dart';
import 'package:super_heroes/repositories/load_super_heroes.dart';

class SuperHeroesStore with ChangeNotifier {
  SuperHeroesStore() {
    fetchSuperHeroesList(); // pra quando abrir já ser executado.
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<HeroItem> _heroItem = [];

  List<HeroItem>? get heroList => _heroItem;

  int page = 1;

  int limit = 0;

  fetchSuperHeroesList() async {
    loading = true;

    limit = page + 10;

    for (var i = page; i < limit; i++) {
      var data = await loadSuperHeroesAPI(i);

      if (data != null) _heroItem.add(data);
    }

    page = limit;

    loading = false;

    notifyListeners();
  }

  getHero({required int index}) {
    return heroList![index];
  }
}
