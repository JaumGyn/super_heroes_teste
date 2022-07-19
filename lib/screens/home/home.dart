import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:super_heroes/models/super_heroes_model.dart';
import 'package:super_heroes/screens/splash/splash.dart';
import 'package:super_heroes/shared/search.dart';
import 'package:super_heroes/shared/superhero.dart';
import 'package:super_heroes/provider/super_heroes_store.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
  }

  _scrollListener() {
    final superHeroesStore = context.watch<SuperHeroesStore>();

    if (_scrollController!.offset >=
            _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
      setState(() {
        print("reach the bottom");
        superHeroesStore.fetchSuperHeroesList();
      });
    }
    if (_scrollController!.offset <=
            _scrollController!.position.minScrollExtent &&
        !_scrollController!.position.outOfRange) {
      setState(() {
        print("reach the top");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SuperHeroesStore>(
      builder: (_, superHeroesStore, __) {
        return (superHeroesStore.heroList!.length > 0)
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Super Heroes",
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: HeroSearch(all: superHeroesStore.heroList!),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                ),
                body: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: superHeroesStore.heroList!.length,
                                itemBuilder: (_, index) {
                                  HeroItem hero =
                                      superHeroesStore.getHero(index: index);

                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                    child: SuperHero(
                                      heroItem: hero,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    superHeroesStore.loading == true
                        ? Center(
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Lottie.asset('assets/running.json'),
                            ),
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          )
                  ],
                ),
              )
            : Splash();
      },
    );
  }
}
