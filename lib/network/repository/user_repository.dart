import 'package:base_library/base_library.dart';
import 'package:flutterdemo/bloc/bloc_index.dart';
import 'package:flutterdemo/network/api/apis.dart';

class UserRepository {


  Future<UserModel> login(LoginReq req) async {
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
        .requestR<Map<String, dynamic>>(Method.post, WanAndroidApi.user_login,
            data: req.toJson());
    print("===================login res:${baseResp.data}");
    if (baseResp.code != Constant.status_success) {
      print("===================login res er:${baseResp.msg}");
      return Future.error(baseResp.msg);
    }
    _setCookie(baseResp);
    UserModel model = UserModel.fromJson(baseResp.data);
    //CacheUtil().setUserModel(model);
    SpUtil.putObject(BaseConstant.keyUserModel, model);
    return model;
  }


  Future<UserModel> register(RegisterReq req) async {
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
        .requestR<Map<String, dynamic>>(
            Method.post, WanAndroidApi.user_register,
            data: req.toJson());
    if (baseResp.code != Constant.status_success) {
      return Future.error(baseResp.msg);
    }
    _setCookie(baseResp);
    UserModel model = UserModel.fromJson(baseResp.data);
    //CacheUtil().setUserModel(model);
    SpUtil.putObject(BaseConstant.keyUserModel, model);
    return model;
  }


  void _setCookie(BaseRespR<Map<String, dynamic>> baseResp) {
    baseResp.response.headers.forEach((String name, List<String> values) {
      if (name == "set-cookie") {
        String cookie = values.toString();
        LogUtil.e("set-cookie: " + cookie);
        SpUtil.putString(BaseConstant.keyAppToken, cookie);
        DioUtil().setCookie(cookie);
        //CacheUtil().setLogin(true);
      }
    });
  }

}
