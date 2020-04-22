import 'dart:async';
class Bloc implements BaseBloc {
  final _emailController =StreamController<String>();
  final _passwordController=StreamController<String>();

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }



}
abstract class BaseBloc
{
  void dispose();
}