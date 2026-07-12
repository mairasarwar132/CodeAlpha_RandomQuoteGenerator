import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/quotes/presentation/widgets/splash_gate.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const ProviderScope(child: RandomQuoteApp()));
}

class RandomQuoteApp extends ConsumerWidget {
  const RandomQuoteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Random Quote Generator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      builder: (context, child) {
        return SplashGate(child: child ?? const SizedBox.shrink());
      },
    );
  }
}
