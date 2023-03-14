import 'package:flutter/material.dart';
import 'package:shopping_app/views/screen/cart_page.dart';
import 'package:shopping_app/views/screen/homepage.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/views/screen/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) => HomePage(),
      routes: [
        GoRoute(
          path: 'product/:id',
          name: 'product',
          builder: (context, state) => ProductDetailPage(),
        ),
        GoRoute(
          path: 'cart',
          name: 'cart',
          builder: (BuildContext context, GoRouterState state) => CartPage(),
        )
      ]),
]);

// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRouter(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeScreen();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           builder: (BuildContext context, GoRouterState state) {
//             return const DetailsScreen();
//           },
//         ),
//       ],
//     ),
//   ],
// );
