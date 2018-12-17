enum Actions{
  login,
  logout
}

/// App 状态
/// 
/// 状态中所有数据都应该是只读的，所以，全部以 get 的方式提供对外访问，不提供 set 方法
class AppState {
  /// J.W.T
  String _authorizationToken;

  // 获取当前的认证 Token
  get authorizationToken => _authorizationToken;

  // 获取当前是否处于已认证状态
  get authed => _authorizationToken.length > 0;

  AppState(this._authorizationToken);
}

/// Reducer
AppState reducer(AppState state, action) {
  switch(action) {
    case Actions.login:
      return AppState('J.W.T');
    case Actions.logout:
      return AppState('');
    default:
      return state;
  }
}
