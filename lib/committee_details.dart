import 'package:flutter/material.dart';
import 'package:flutter_app/github_repository.dart';

class CommitteeDetailsWidget extends StatefulWidget {
  CommitteeDetailsWidget({Key key, this.item}) : super(key: key);
  final GithubRepository item;

  @override
  _CommitteeDetailsWidgetState createState() => _CommitteeDetailsWidgetState();
}

class _CommitteeDetailsWidgetState extends State<CommitteeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.fullName),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text("Language"),
            ),
            Text(widget.item.language)
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text("Description"),
            ),
            Flexible(child: Text(widget.item.description))
          ]),
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }
}
