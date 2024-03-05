import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:hrv4life_core/src/loader/hrv4life_loader.dart';

class Hrv4lifeCoreConfig extends StatelessWidget {
  const Hrv4lifeCoreConfig({
    super.key,
    this.bindings,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
  });

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageBuilder>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: kDebugMode,
        bindings: bindings,
        pages: [...pages ?? [], ...pagesBuilders ?? []],
        builder: (context, routes, flutterGetItNavObserver) {
          return AsyncStateBuilder(
            loader:Hrv4lifeLoader(),
            builder: (navigatorObserver) {
            return MaterialApp(
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver,
                ],
              routes: routes,
              title: title,
            );
          });
        });
  }
}
