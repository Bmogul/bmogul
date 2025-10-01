import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: ThemeData.light().textTheme.titleLarge!.copyWith(),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>{}; // Set of favorite wordpairs
  var wordHistory =
      <
        WordPair
      >[]; // history of wordpairs, only allows to go back to prev not go forwad

  void toggleFavorite() {
    if (favorites.contains(current))
      favorites.remove(current);
    else
      favorites.add(current);

    notifyListeners();
  }

  void nextWord() {
    wordHistory.add(current);
    current = WordPair.random();
    notifyListeners();
  }

  void prevWord() {
    current = wordHistory.removeLast();
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                    indicatorColor: Theme.of(context).colorScheme.surface,
                    destinations: [
                      NavigationRailDestination(
                        indicatorColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        indicatorColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (val) {
                      setState(() {
                        selectedIndex = val;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //color: Theme.of(context).colorScheme.secondaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
      fontSize: 35,
    );
    var favorites = context.watch<MyAppState>().favorites;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 90),
          Text("Favorites", style: titleStyle),
          Expanded(
            child: ListView(
              children: <Widget>[
                for (var fav in favorites)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.secondaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.favorite, color: Color(0xFF692626),),
                        title: Text(fav.asLowerCase),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
      fontSize: 35,
    );

    final actionButtonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(100, 50),
      backgroundColor: theme.colorScheme.secondary,
    );

    final actionButtonTextStyle = TextStyle(
      color: theme.colorScheme.onSecondary,
    );

    final icon = appState.favorites.contains(pair)
        ? Icons.favorite
        : Icons.favorite_border;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WordPair", style: titleStyle),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.nextWord();
                },
                style: actionButtonStyle,
                child: Text('Next', style: actionButtonTextStyle),
              ),
              SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  appState.prevWord();
                },
                style: actionButtonStyle,
                child: Text('Previous', style: actionButtonTextStyle),
              ),
            ],
          ),

          ElevatedButton.icon(
            onPressed: () {
              appState.toggleFavorite();
            },
            icon: Icon(icon),
            label: Text('Like'),
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      elevation: 9,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
