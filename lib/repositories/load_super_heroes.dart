import 'dart:convert';

import 'package:super_heroes/const/const_api.dart';
import 'package:http/http.dart' as http;
import 'package:super_heroes/models/super_heroes_model.dart';

Future<HeroItem?> loadSuperHeroesAPI(int index) async {
  try {
    final response = await http
        .get(Uri.parse("${ConstsAPI.superapiURL}/${index.toString()}"));
    var decode = jsonDecode(response.body);
    return HeroItem.fromJson(decode);
  } catch (error, stacktrace) {
    print("Erro ao carregar lista" + stacktrace.toString());
    return null;
  }
}
