import 'package:flutter_modular/flutter_modular.dart';

import 'view/launch_list_ui.dart';
import 'view/testRoute.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => LaunchListScreen());
    r.child('/testRT', child: (context) => TestRte());
    // r.child('/launch_datail', child: ((context) => LaunchDetail(launch: launch))
  }
}
