import 'package:flutter_modular/flutter_modular.dart';

class LaunchListModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {}
}

// class LaunchListModule extends Module {
//   @override
//   final List<Bind> binds = [
//     Bind.singleton((i) => LaunchListBloc()),
//   ];

//   @override
//   final List<ModularRoute> routes = [
//     ChildRoute('/', child: (_, args) => LaunchList()),
//   ];
// }

