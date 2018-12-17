import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'state.dart';
import 'root.dart';

/// 示例App
class DemoApp extends StatelessWidget {
  final Store<AppState> store;

  DemoApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Redux Demo App',
        home: Root()
      ),
    );
  }
}