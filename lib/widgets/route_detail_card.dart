import 'package:flutter/material.dart';

class RouteDetailCardList extends StatefulWidget {
  RouteDetailCardList({Key? key}) : super(key: key);

  @override
  _RouteDetailCardListState createState() => _RouteDetailCardListState();
}

class _RouteDetailCardListState extends State<RouteDetailCardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(""),
                            title: Text(""),
                            subtitle: Text(""),
                            trailing: (index == 0)
                                ? Icon(Icons.home)
                                : Icon(Icons.arrow_upward),
                          ),
                          ExpansionTile(
                            title: Text("Zwischenstopps"),
                            leading: Icon(Icons.more_vert),
                            children: [],
                          ),
                          ListTile(
                            leading: Text(""),
                            title: Text(""),
                            subtitle: Text(""),
                            trailing: (index == 5)
                                ? Icon(Icons.flag)
                                : Icon(Icons.arrow_downward),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
