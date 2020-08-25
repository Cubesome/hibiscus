import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
          IconButton(
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
          hintText: 'There was no text, there are no results. :(',
        ),
      ),
    );
  }
}
