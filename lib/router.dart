import 'package:go_router/go_router.dart';
import 'package:siva_website/home/home.dart';
import 'package:siva_website/professional/professional.dart';

class CustomRouter {
  // GoRouter configuration
  static final config = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/professional',
        builder: (context, state) => const ProfessionalPage(),
      ),
    ],
  );
}
