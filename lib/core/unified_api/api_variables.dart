import 'dart:developer';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'http';
  final _host = "10.0.2.2";

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      port: 7000,
      path: 'api/v1.0.0/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString(), name: 'uri');
    return uri;
  }

  ////auth////
  Uri _authUri({required String path}) => _mainUri(path: 'users/$path');
  Uri signUp() => _authUri(path: 'signup/user');
  Uri signUpEng() => _authUri(path: 'signup/eng');
  Uri signIn() => _authUri(path: 'login');
  ///////////
  ////profile////
  Uri _profileUri({required String path}) => _mainUri(path: 'users/$path');
  Uri getProfile() => _profileUri(path: 'me');
  Uri updateProfile() => _profileUri(path: 'updateMe');
  Uri updatePassword() => _profileUri(path: 'updateMyPassword');
  ///////////////
  ////care////
  Uri getCares() => _mainUri(path: 'cares');
  Uri deleteIllusions(String id) => _mainUri(path: 'pests/$id');
  Uri deleteCares(String id) => _mainUri(path: 'cares/$id');
  Uri getIllusions() => _mainUri(path: 'pests');
  ///////////////
  ///////chat////
  Uri getAllUsers() => _mainUri(path: 'users');
  Uri getChats() => _mainUri(path: 'chats/mychats');
  Uri getOneChat(String id) => _mainUri(path: 'users/$id');
  Uri createChat() => _mainUri(path: 'chats');
  Uri getAllMessages(String id) => _mainUri(
      path: 'chats/$id/messages', queryParameters: {'sort': 'createdAt'});
  Uri sendMessage(String id) => _mainUri(
        path: 'chats/$id/messages',
      );
  Uri adverts() => _mainUri(path: 'advrtisements');
  Uri advices({String? id}) =>
      _mainUri(path: id == null ? "advices" : 'advices/$id');
  Uri getStorage() => _mainUri(path: 'Storages');
  Uri deleteStorage(String id) => _mainUri(path: 'Storages/$id');
  Uri getAgri() => _mainUri(path: 'agr_machins');
  Uri deleteAgri(String id) => _mainUri(path: 'agr_machins/$id');
  Uri plants() => _mainUri(path: 'plants');
  Uri type_of_classifys() => _mainUri(path: 'type_of_classifys');
  Uri typesOfClassifyByID(String id) => _mainUri(path: 'type_of_classifys/$id');
  // Uri deleteMessage(String id) => _mainUri(path: 'users/$id');

  // Uri updateMessage(String id) => _mainUri(path: 'users/$id');
  ///////////////
}
