import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:super_heroes/models/super_heroes_model.dart';
import 'package:super_heroes/shared/avatar.dart';

class Details extends StatefulWidget {
  final HeroItem? heroItem;

  Details({Key? key, this.heroItem}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        title: Text("Super Heroes"),
      ),
      body: SuperheroDetails(widget: widget, heroItem: widget.heroItem),
    );
  }
}

class SuperheroDetails extends StatefulWidget {
  const SuperheroDetails({
    Key? key,
    required this.widget,
    required this.heroItem,
  }) : super(key: key);

  final Details? widget;
  final HeroItem? heroItem;

  @override
  _SuperheroDetailsState createState() => _SuperheroDetailsState();
}

class _SuperheroDetailsState extends State<SuperheroDetails> {
  Map<String, bool>? _categoryExpansionStateMap;
  late bool isExpandedo;

  @override
  void initState() {
    super.initState();

    _categoryExpansionStateMap = {
      "Biography": true,
      "Appearance": false,
      "Work": false,
      "Power Stats": false,
      "Connections": false,
    };

    isExpandedo = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.green.shade200,
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Avatar(img: widget.heroItem!.image),
            SizedBox(
              height: 13.0,
            ),
            Text(
              "${widget.heroItem!.name}",
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${widget.heroItem!.biography!.aliases!.isEmpty ? widget.heroItem!.name : widget.heroItem!.biography!.aliases!.first}",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool? isExpanded) {
                setState(() {
                  _categoryExpansionStateMap![_categoryExpansionStateMap!.keys
                      .toList()[index]] = !isExpanded!;
                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Biography",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Biography(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap!["Biography"]!),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Appearance",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Appearance(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap!["Appearance"]!),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Work",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Work(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap!["Work"]!),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Power Stats",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: PowerStats(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap!["Power Stats"]!),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Connections",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Connections(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap!["Connections"]!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Biography extends StatelessWidget {
  final HeroItem? heroItem;

  const Biography({Key? key, this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Alter Ego(s)".toUpperCase(),
          ),
          subtitle: Text(
            "${heroItem!.biography!.alterEgos}",
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        ListTile(
          title: Text(
            "Aliases".toUpperCase(),
          ),
          subtitle: Text(
            heroItem!.biography!.aliases
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Place of birth".toUpperCase(),
          ),
          subtitle: Text(
            "${heroItem!.biography!.placeOfBirth}",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "First Appearance".toUpperCase(),
          ),
          subtitle: Text(
            "${heroItem!.biography!.firstAppearance}",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Creator".toUpperCase(),
          ),
          subtitle: Text(
            "${heroItem!.biography!.publisher}",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class Appearance extends StatelessWidget {
  final HeroItem? heroItem;

  const Appearance({Key? key, required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Gender".toUpperCase(),
          ),
          subtitle: Text(
            "${heroItem!.appearance!.gender}",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Race".toUpperCase(),
          ),
          subtitle: Text(
            "${heroItem!.appearance!.race}"
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Height".toUpperCase(),
          ),
          subtitle: Text("${heroItem!.appearance!.height}"),
        ),
        ListTile(
          title: Text(
            "Weight".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "${heroItem!.appearance!.weight}"
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Eye Color".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "${heroItem!.appearance!.eyeColor}",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class Work extends StatelessWidget {
  final HeroItem? heroItem;

  const Work({Key? key, required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Base".toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        "${heroItem!.work!.base}",
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
    );
  }
}

class PowerStats extends StatelessWidget {
  final HeroItem? heroItem;

  const PowerStats({Key? key, required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Intelligence".toUpperCase() +
                " - ${heroItem!.powerstats!.intelligence}%",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: double.parse(heroItem!.powerstats!.intelligence!) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blue,
          ),
        ),
        ListTile(
          title: Text(
            "Strength".toUpperCase() + " - ${heroItem!.powerstats!.strength}%",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: double.parse(heroItem!.powerstats!.strength!) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orange,
          ),
        ),
        ListTile(
          title: Text(
            "Speed".toUpperCase() + " - ${heroItem!.powerstats!.speed}%",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: double.parse(heroItem!.powerstats!.speed!) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text(
            "Durability".toUpperCase() +
                " - ${heroItem!.powerstats!.durability}%",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: double.parse(heroItem!.powerstats!.durability!) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orange,
          ),
        ),
        ListTile(
          title: Text(
            "Power".toUpperCase() + " - ${heroItem!.powerstats!.power}%",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: double.parse(heroItem!.powerstats!.power!) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red,
          ),
        ),
        ListTile(
          title: Text(
            "Combat".toUpperCase() + " - ${heroItem!.powerstats!.combat}%",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: double.parse(heroItem!.powerstats!.combat!) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.black,
          ),
        ),
      ],
    );
  }
}

class Connections extends StatelessWidget {
  final HeroItem? heroItem;

  const Connections({Key? key, required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Team Affiliation".toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            "${heroItem!.connections!.groupAffiliation}",
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        ListTile(
          title: Text(
            "Relatives".toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            "${heroItem!.connections!.relatives}"
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
