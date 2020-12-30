import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:share/share.dart';
import 'package:clipboard/clipboard.dart';

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
          'Owotionized',
          style: TextStyle(
            fontFamily: 'PalanquinDark',
          ),
        ),
        actions: [
          kIsWeb
              ? Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        FlutterClipboard.copy(widget.resultText);
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Your results were copied to clipboard!'),
                          ),
                        );
                      },
                    );
                  },
                )
              : IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share(widget.resultText);
                  },
                ),
        ],
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
          hintText: 'An error has occurred or the input was empty.',
        ),
      ),
    );
  }
}
