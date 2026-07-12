import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/quotes/presentation/screens/quote_home_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: QuoteHomeScreen.routePath,
    routes: [
      GoRoute(
        path: QuoteHomeScreen.routePath,
        name: QuoteHomeScreen.routeName,
        builder: (context, state) => const QuoteHomeScreen(),
      ),
    ],
  );
});
