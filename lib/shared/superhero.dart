import 'package:flutter/material.dart';
import 'package:super_heroes/models/super_heroes_model.dart';

import 'package:super_heroes/screens/detail/details.dart';
import 'package:super_heroes/shared/avatar.dart';

class SuperHero extends StatelessWidget {
  final HeroItem? heroItem;

  SuperHero({
    Key? key,
    this.heroItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return Details(
            heroItem: heroItem,
          );
        });

        Navigator.of(context).push(router);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  Avatar(img: heroItem!.image),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${heroItem!.name}",
                          ),
                          Text(
                            "${heroItem!.biography!.aliases!.isEmpty ? heroItem!.name : heroItem!.biography!.aliases!.first}",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${heroItem!.biography!.publisher}",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
