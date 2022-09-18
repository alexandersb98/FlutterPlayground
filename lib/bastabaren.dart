import 'package:flutter/material.dart';
import 'package:flutter_playground/bastabaren_route_generator.dart';
import 'package:flutter_playground/routes.dart';

void main() {
  runApp(const BastaBaren());
}

class BastaBaren extends StatelessWidget {
  const BastaBaren({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.highContrastDark(primary: Colors.orange)
      ),
      initialRoute: Routes.HOME,
      onGenerateRoute: RouteGeneratorBB.generateRoute,
    );
  }
}

class BastaBarenHome extends StatelessWidget {
  const BastaBarenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bästa Baren"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/beer.gif"),
            fit: BoxFit.fill,
          ),
        ),
        child: const Center(
          child: PubSearcher()
        )
      )
    );
  }
}

class PubSearcher extends StatefulWidget {
  const PubSearcher({Key? key}) : super(key: key);

  @override
  State<PubSearcher> createState() => _PubSearcherState();
}

class _PubSearcherState extends State<PubSearcher> {

  final _textController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 200,
        child: Column(
          children: [
            const Divider(),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Ange en stad',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                    setState(() {
                      _isButtonEnabled = false;
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.orange,
                  ),
                )
              ),
              style: TextStyle(color: Colors.black),
              onChanged: (string) {
                var enabled = string.isNotEmpty;
                if (enabled == _isButtonEnabled)
                  return;

                setState(() {
                  _isButtonEnabled = enabled;
                });
              },
              onSubmitted: (_) => Navigator.of(context).pushNamed(Routes.SEARCH_RESULTS, arguments: _textController.text),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: _buildSearchButton()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildSearchButton() {
    return ElevatedButton(
      onPressed: !_isButtonEnabled ? null : () =>
        Navigator.of(context).pushNamed(Routes.SEARCH_RESULTS, arguments: _textController.text),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Hitta bästa baren!',
          style: TextStyle(
              fontSize: 20
          ),
        ),
      )
    );
  }
}

class SearchResultsPubs extends StatelessWidget {
  final String search_term;

  const SearchResultsPubs({Key? key, required this.search_term}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pubs = PubDatabase.getPubs(from: search_term);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search results for "$search_term"')
      ),
      body: Center(
        child: PubList(data: pubs),
      )
    );
  }


}

class PubList extends StatefulWidget {
  const PubList({Key? key, required this.data}) : super(key: key);

  final List<Pub>? data;

  @override
  State<PubList> createState() => _PubListState(nearby_pubs: data);
}

class _PubListState extends State<PubList> {
  final List<Pub>? nearby_pubs;

  final _suggestions = <Pub>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  _PubListState({required this.nearby_pubs}) : super();

  @override
  Widget build(BuildContext context) {
    if (nearby_pubs == null) {
      return _errorPage('No bars found! Try enter a different location.');
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(nearby_pubs!);
        }

        return ListTile(
            title: Text(_suggestions[index].name, style: _biggerFont));
      },
    );
  }
}

Widget _errorPage(String message) {
  return Center(
      child: Text(message)
  );
}

class PubDatabase {
  static var pubs_gbg = <Pub>[
    Pub("Ölstugan", "Göteborg"),
    Pub("Bärsen", "Göteborg"),
    Pub("Bira bira bira", "Göteborg"),
    Pub("Down Under", "Göteborg"),
    Pub("Alles bar", "Göteborg"),
  ];

  static var pubs_sthlm = <Pub>[
    Pub("Sliskiga puben", "Stockholm"),
    Pub("Globen", "Stockholm"),
    Pub("Ciderhuset", "Stockholm"),
    Pub("Sture P", "Stockholm"),
    Pub("Dinos bar", "Stockholm"),
  ];

  static List<Pub>? getPubs({required String from}) {
    switch (from) {
      case 'Gothenburg':
      case 'Göteborg':
        return pubs_gbg;
      case 'Stockholm':
        return pubs_sthlm;
      default:
        return null;
    }
  }
}

class Pub {
  String name = "";
  String city = "";

  Pub(String name, String city) {
    this.name = name;
    this.city = city;
  }
}