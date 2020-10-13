import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_archi/core/services/authentication_service.dart';

import 'core/models/user.dart';
import 'core/services/api.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  //api is not dependent on any other services
  Provider.value(value: Api())
];

List<SingleChildWidget> dependentServices = [
  ///authentication is dependent on Api
  ///so using ProxyProvider
  ProxyProvider<Api, AuthenticationService>(
    ///create is used if we use any initial logic
    //create: ,
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  )
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  )
];
