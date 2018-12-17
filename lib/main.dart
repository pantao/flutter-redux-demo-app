import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'app.dart';
import 'state.dart';

void main() async {
  // 创建一个持久化器
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: true
  );

  // 从 persistor 中加载上一次存储的状态
  final initialState = await persistor.load();

  final store = Store<AppState>(
    reducer,
    initialState: initialState ?? AppState(''),
    middleware: [persistor.createMiddleware()]
  );
  runApp(new DemoApp(store));
}