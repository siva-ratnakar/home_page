import 'package:go_router/go_router.dart';
import 'package:siva_website/home/home.dart';
import 'package:siva_website/professional/professional.dart';

enum NavigationRoutes {
  home('/'),
  professional('/professional');

  const NavigationRoutes(this.path);
  final String path;
}

class CustomRouter {
  // GoRouter configuration
  static final config = GoRouter(
    routes: [
      GoRoute(
        path: NavigationRoutes.home.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: NavigationRoutes.professional.path,
        builder: (context, state) => const ProfessionalPage(),
      ),
    ],
  );
}
