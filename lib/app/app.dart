import 'package:eshop/router/router.dart';
import 'package:eshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget  {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: EshopTheme.lightTheme,
      darkTheme: EshopTheme.darkTheme,
      routerConfig: router,
    );
  }
}
