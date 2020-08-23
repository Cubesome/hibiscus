import 'package:flutter/material.dart';

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
