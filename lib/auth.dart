import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'state.dart';

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: Text('登录'),
          ),
          body: Center(
            child: FlatButton(
              child: Text('登录'),
              onPressed: () {
                // 通过 store.dispatch 函数，可以发出 action（跟 Redux 是一样的），而 Action 是在
                // AppState 中定义的枚举 Actions.login
                store.dispatch(Actions.login);
                // 之后，关闭当前的 Modal，就可以看到应用所有数据都更新了
                Navigator.pop(context);
              },
            )
          ),
        );
      },
    );
  }
}