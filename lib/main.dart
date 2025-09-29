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
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var wordHistory = <WordPair>[];

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

class MyHomePage extends StatelessWidget {
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WordPair", style: titleStyle),
            BigCard(pair: pair),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                appState.nextWord();
              },
              style: actionButtonStyle,
              child: Text('Next', style: actionButtonTextStyle),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                appState.prevWord();
              },
              style: actionButtonStyle,
              child: Text('Previous', style: actionButtonTextStyle),
            ),
          ],
        ),
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
