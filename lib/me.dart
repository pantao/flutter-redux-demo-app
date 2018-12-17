import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'state.dart';

class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: Text('退出'),
          ),
          body: Center(
            child: FlatButton(
              child: Text('退出'),
              onPressed: () {
                store.dispatch(Actions.logout);
                // 此处我们不需要去更新Tab Index，在 Root 页面中，对 store 里面的 authed 值已经做了监听，如果
                // Actions.logout 被触发后， authed 的值会变成 false，那么App将自动切换首页
              },
            )
          ),
        );
      },
    );
  }
}