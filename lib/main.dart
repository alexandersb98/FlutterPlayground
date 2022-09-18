import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class BlueBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

class BlueGrid extends StatelessWidget {
  const BlueGrid({super.key});

  Widget _makeRow(int width) {
    List<Widget> rowChildren = [];
    for (int i = 0; i < width; i++) {
      rowChildren += [BlueBox()];
    }
    return Row(
      children: rowChildren,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center, // how to align on the orthogonal axis (for rows it's vertical, and for columns horizontal)
    );
  }

  Widget _makeGrid(int width, int height) {
    List<Widget> rows = [];

    for (int j = 0; j < height; j++) {
      rows.add( _makeRow(width) );
    }

    return Column(
      children: rows,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _makeGrid(4, 4);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterPlayground",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.orange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FlutterPlayground"),
        ),
        body: const BlueGrid(),
      )
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bästa Biran",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.amber,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bästa Biran'),
        ),
        body: const Center(
          child: PubList(),
        ),
      ),
    );
  }
}

class PubList extends StatefulWidget {
  const PubList({Key? key}) : super(key: key);

  @override
  State<PubList> createState() => _PubListState(found_pubs: PubDatabase.pubs);
}

class _PubListState extends State<PubList> {
  final List<Pub> found_pubs;

  final _suggestions = <Pub>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  _PubListState({
    required this.found_pubs
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(PubDatabase.pubs);
        }

        return ListTile(
            title: Text(_suggestions[index].name, style: _biggerFont));
      },
    );
  }
}

class PubDatabase {
  static var pubs = <Pub>[
    Pub("Ölstugan", "Göteborg"),
    Pub("Ciderhuset", "Stockholm"),
    Pub("Bärsen", "Göteborg"),
    Pub("Sture P", "Stockholm"),
    Pub("Dinos bar", "Värnamo"),
  ];
}

class Pub {
  String name = "";
  String city = "";

  Pub(String name, String city) {
    this.name = name;
    this.city = city;
  }
}
