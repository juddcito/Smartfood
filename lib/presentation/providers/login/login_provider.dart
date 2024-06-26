 import 'package:flutter_riverpod/flutter_riverpod.dart';
 import 'package:smartfood/domain/entities/usuario.dart';
import 'package:smartfood/presentation/providers/login/login_user_repository_provider.dart';

 final loginUserProvider = StateNotifierProvider<LoggedUserNotifier, Usuario>((ref) {

  final loginUser = ref.watch(loginUserLocalRepositoryProvider).login;

   return LoggedUserNotifier(
    loginUser: loginUser,
   );

 });

 typedef LoginCallback = Future<Usuario> Function(String, String);

 class LoggedUserNotifier extends StateNotifier<Usuario> {

   final LoginCallback loginUser;

   LoggedUserNotifier({required this.loginUser}): super(Usuario(usuarioId: 0, nombre: '', edad: 0, genero: '', telefono: '', password: '', necesidad: 0, preferencia: 0, costomaximo: 0));

  Future<Usuario> loadLoggedUser(String username, String password) async {

    final Usuario loggedUser = await loginUser(username, password);
     state = loggedUser;
     return loggedUser;
   }

 }