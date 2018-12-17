import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'state.dart';
import 'auth.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: Text('首页'),
          ),
          body: Center(
            child: store.state.authed
              ? Text('您已登录')
              : FlatButton(
                child: Text('去登录'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Auth(),
                      fullscreenDialog: true
                    )
                  );
                },
              )
          ),
        );
      },
    );
  }
}