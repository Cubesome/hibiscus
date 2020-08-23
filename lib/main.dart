import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hibiscus/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hibiscus by Cubesome',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _processingInput = false;
  bool _textAlteration = false;
  bool _kaomojiInsertion = false;
  bool _commentInsertion = false;
  double _enhancementIntensity = 1.0;
  String _userInput;
  String _processedText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hibiscus',
          style: TextStyle(
            fontFamily: 'PalanquinDark',
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 100,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'PalanquinDark',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.teal,
                    Color(0xff1c86a6),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text(
                'Intensity',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              subtitle: Slider(
                value: _enhancementIntensity,
                onChanged: (double _sliderValueHolder) {
                  setState(() {
                    _enhancementIntensity = _sliderValueHolder;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.text_fields,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Text alteration',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              trailing: Switch(
                inactiveTrackColor: Theme.of(context).primaryColor,
                inactiveThumbColor: Theme.of(context).hintColor,
                value: _textAlteration,
                onChanged: (bool _switchStateHolder) {
                  setState(() {
                    _textAlteration = _switchStateHolder;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.insert_emoticon,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Kaomoji insertion',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              trailing: Switch(
                inactiveTrackColor: Theme.of(context).primaryColor,
                inactiveThumbColor: Theme.of(context).hintColor,
                value: _kaomojiInsertion,
                onChanged: (bool _switchStateHolder) {
                  setState(() {
                    _kaomojiInsertion = _switchStateHolder;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.comment,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Comment insertion',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              trailing: Switch(
                inactiveTrackColor: Theme.of(context).primaryColor,
                inactiveThumbColor: Theme.of(context).hintColor,
                value: _commentInsertion,
                onChanged: (bool _switchStateHolder) {
                  setState(() {
                    _commentInsertion = _switchStateHolder;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: TextField(
        maxLines: null,
        expands: true,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontFamily: 'Quicksand',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Text to enhance...',
        ),
        onChanged: (String _userInputHolder) {
          _userInput = _userInputHolder;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: _processingInput
            ? CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              )
            : Icon(Icons.arrow_forward),
        onPressed: () async {
          setState(() {
            _processingInput = true;
          });
          await new Future.delayed(const Duration(seconds : 2)); // Simulation of text processing that takes 2 seconds.
          //TODO: Add text processing
          _processedText = 'Processed $_userInput';
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(resultText: _processedText),
            ),
          );
          setState(() {
            _processingInput = false;
          });
        },
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  final String resultText;
  ResultPage({Key key, this.resultText}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your result',
          style: TextStyle(
            fontFamily: 'PalanquinDark',
          ),
        ),
      ),
      body: TextField(
        controller: TextEditingController(
          text: widget.resultText,
        ),
        readOnly: true,
        maxLines: null,
        expands: true,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontFamily: 'Quicksand',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: 'There was no text, there are no results. :(',
        ),
      ),
    );
  }
}
