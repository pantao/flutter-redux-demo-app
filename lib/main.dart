import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'app.dart';
import 'state.dart';

void main() {
  final store = Store<AppState>(reducer, initialState: AppState(''));
  runApp(new DemoApp(store));
}