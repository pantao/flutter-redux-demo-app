import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

/// 状态
import 'state.dart';
/// 登录页面
import 'auth.dart';
/// 我的页面
import 'me.dart';
/// 首页
import 'home.dart';

/// 应用入口页
class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _RootState();
    }
}

/// 入口页状态
class _RootState extends State<Root> {
  /// 当前被激活的 Tab Index
  int _currentTabIndex;
  /// 所有 Tab 列表页
  List<Widget> _tabPages;

  @override
  void initState() {
    super.initState();
    // 初始化 tab 为第 0 个
    _currentTabIndex = 0;
    // 初始化页面列表
    _tabPages = <Widget>[
      // 首页
      Home(),
      // 我的
      Me()
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 使用 StoreConnector 创建 Widget
    // 类似于 React Redux  的 connect，链接 store state 与 Widget
    return StoreConnector<AppState, Store<AppState>>(
      // store 转换器，类似于 react redux 中的 mapStateToProps 方法
      // 接受参数为 `store`，再返回的数据可以被在 `builder` 函数中使用，
      // 在此处，我们直接返回整个 store，
      converter: (store) => store,
      // 构建器，第二个参数 store 就是上一个 converter 函数返回的 store
      builder: (context, store) {
        // 取得当前是否已登录状态
        final authed = store.state.authed;
        return new Scaffold(
          // 如果已登录，则直接可以访问所有页面，否则展示 Home
          body: authed ? _tabPages[_currentTabIndex] : Home(),
          // 底部Tab航
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              // 如果点击的是第 1 个Tab，且当前用户未登录，则直接打开登录 Modal 页
              if (!authed && index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Auth(),
                    fullscreenDialog: true
                  )
                );
              // 否则直接进入相应页面
              } else {
                setState(() {
                  _currentTabIndex = index;
                });
              }
            },
            // 与 body 取值方式类似
            currentIndex: authed ? _currentTabIndex : 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('首页')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('我的')
              )
            ],
          ),
        );
      },
    );
  }
}