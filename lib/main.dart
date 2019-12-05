import 'package:flutter/material.dart';
import 'package:flutter_app/committee_details.dart';
import 'package:flutter_app/committee_repository.dart';
import 'package:flutter_app/github_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final committeesRepository = CommitteesRepository();

  var listItems = new List<GithubRepository>();

  void _find() {
    setState(() {
      committeesRepository.find().then((items) {
        setState(() {
          this.listItems = items;
        });
      });
    });
  }

  void _transition(GithubRepository item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          settings: RouteSettings(name: "/rooms/<roomId>"),
          builder: (BuildContext context) =>
              CommitteeDetailsWidget(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Test"),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var item = listItems[index];
            return GestureDetector(
              onTap: () {
                _transition(item);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Padding(
                  child: Text(
                    '${item.fullName}',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
              ),
            );
          },
          itemCount: listItems.length),
    );
  }

  @override
  void initState() {
    super.initState();
    print("initState");
    _find();
  }
}
