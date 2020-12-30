import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';
import 'package:hibiscus/additional_licenses.dart';
import 'package:hibiscus/result_page.dart';
import 'package:hibiscus/hibiscus_engine.dart';

String appVersion = '0.3.3 beta';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _processingInput = false;
  bool _textAlteration = true;
  bool _kaomojiInsertion = true;
  bool _kaomojiOnlyAfterSentences = false;
  bool _commentsInsertion = true;
  double _kaomojiIntensity = 0.1;
  double _commentsIntensity = 0.2;
  TextEditingController _inputFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Owotion',
          style: TextStyle(
            fontFamily: 'PalanquinDark',
          ),
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.paste_outlined),
              tooltip: 'Paste from clipboard',
              onPressed: () {
                FlutterClipboard.paste().then((_clipboardContent) {
                  _inputFieldController.text = _clipboardContent;
                }, onError: (e) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'The app was unable to paste the content of your clipboard. This may be caused by the lack of permission or content in your clipboard.',
                      ),
                      duration: Duration(seconds: 7),
                    ),
                  );
                });
              },
            );
          }),
          IconButton(
            icon: Icon(Icons.backspace_outlined),
            tooltip: 'Clear input',
            onPressed: () {
              _inputFieldController.text = '';
            },
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 100,
        child: ListView(
          children: [
            DrawerHeader(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'PalanquinDark',
                    fontSize: 30,
                    color: Colors.white,
                  ),
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
            Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
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
                      inactiveTrackColor: Colors.grey.shade400,
                      inactiveThumbColor: Colors.grey.shade700,
                      value: _textAlteration,
                      onChanged: (bool _switchStateHolder) {
                        setState(() {
                          _textAlteration = _switchStateHolder;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  )
                ],
              ),
            ),
            Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.insert_emoticon,
                      color: Theme.of(context).accentColor,
                    ),
                    title: Text(
                      'Kaomoji',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    trailing: Switch(
                      inactiveTrackColor: Colors.grey.shade400,
                      inactiveThumbColor: Colors.grey.shade700,
                      value: _kaomojiInsertion,
                      onChanged: (bool _switchStateHolder) {
                        setState(() {
                          _kaomojiInsertion = _switchStateHolder;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: _kaomojiInsertion,
                    child: ListTile(
                      title: Text(
                        'Insert only after sentences',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      trailing: Switch(
                        inactiveTrackColor: Colors.grey.shade400,
                        inactiveThumbColor: Colors.grey.shade700,
                        value: _kaomojiOnlyAfterSentences,
                        onChanged: (_kaomojiOnlyAfterSentencesValueHolder) {
                          setState(() {
                            _kaomojiOnlyAfterSentences =
                                _kaomojiOnlyAfterSentencesValueHolder;
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _kaomojiInsertion,
                    child: Slider(
                      value: _kaomojiIntensity,
                      onChanged: (double _sliderValueHolder) {
                        setState(() {
                          _kaomojiIntensity = _sliderValueHolder;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  )
                ],
              ),
            ),
            // TODO: Uncomment this part after completing comment insertion part of the Hibiscus Engine
            // Card(
            //   color: Theme.of(context).primaryColor,
            //   child: Column(
            //     children: [
            //       ListTile(
            //         leading: Icon(
            //           Icons.comment,
            //           color: Theme.of(context).accentColor,
            //         ),
            //         title: Text(
            //           'Comments',
            //           style: TextStyle(
            //             color: Theme.of(context).accentColor,
            //           ),
            //         ),
            //         trailing: Switch(
            //           inactiveTrackColor: Colors.grey.shade400,
            //           inactiveThumbColor: Colors.grey.shade700,
            //           value: _commentsInsertion,
            //           onChanged: (bool _switchStateHolder) {
            //             setState(() {
            //               _commentsInsertion = _switchStateHolder;
            //             });
            //           },
            //         ),
            //       ),
            //       Visibility(
            //         visible: _commentsInsertion,
            //         child: Slider(
            //           value: _commentsIntensity,
            //           onChanged: (double _sliderValueHolder) {
            //             setState(() {
            //               _commentsIntensity = _sliderValueHolder;
            //             });
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         height: 5.0,
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              onTap: () {
                updateAdditionalLicenses();
                showAboutDialog(
                  context: context,
                  applicationIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage('assets/images/hibiscus_icon.png'),
                      width: 50,
                    ),
                  ),
                  applicationVersion: 'Version: $appVersion',
                  applicationName: 'Owotion',
                  applicationLegalese: 'Developed by Cubesome',
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                          'This simple app provides you with the amazing functionality that you didn\'t even know you needed. If you want to know how it works, feel free to look under the hood by checking out our ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'repository',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://github.com/cubesome/hibiscus');
                            },
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                  ],
                );
              }
            ),
            ListTile(
              leading: Icon(
                Icons.gavel,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Licenses',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              onTap: () {
                updateAdditionalLicenses();
                showLicensePage(
                  context: context,
                  applicationIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage('assets/images/hibiscus_icon.png'),
                      width: 50,
                    ),
                  ),
                  applicationVersion: 'Version: $appVersion',
                  applicationName: 'Owotion',
                  applicationLegalese: 'Developed by Cubesome',
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.code,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Source code',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              onTap: () {
                launch('https://github.com/cubesome/hibiscus');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.bug_report,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Report an issue',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              onTap: () {
                launch('https://github.com/cubesome/hibiscus/issues');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TextField(
          controller: _inputFieldController,
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
            hintText: 'Text to process...',
          ),
        ),
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          child: _processingInput
              ? CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : Icon(Icons.arrow_forward),
          onPressed: () {
            Scaffold.of(context).removeCurrentSnackBar();
            if (!_processingInput) {
              setState(() {
                _processingInput = true;
              });
              if (_inputFieldController.text != null) {
                if (_inputFieldController.text.length > 0) {
                  Map _hibiscusEngineParameters = {
                    'textToProcess': _inputFieldController.text,
                    'kaomojiIntensity': _kaomojiIntensity,
                    'commentsIntensity': _commentsIntensity,
                    'textAlteration': _textAlteration,
                    'kaomojiInsertion': _kaomojiInsertion,
                    'kaomojiOnlyAfterSentences': _kaomojiOnlyAfterSentences,
                    'commentsInsertion': _commentsInsertion,
                  };
                  compute(
                    hibiscusEngine,
                    _hibiscusEngineParameters,
                  ).then((_outputText) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(resultText: _outputText),
                      ),
                    );
                    setState(() {
                      _processingInput = false;
                    });
                  }, onError: (e) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'An error has occurred while trying to process your input.'),
                      ),
                    );
                    setState(() {
                      _processingInput = false;
                    });
                  });
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Please enter some text to process and try again.'),
                    ),
                  );
                  setState(() {
                    _processingInput = false;
                  });
                }
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Please enter some text to process and try again.'),
                  ),
                );
                setState(() {
                  _processingInput = false;
                });
              }
            } else {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Previously started processing is still in progress, please wait...'),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
