import 'package:flutter/material.dart';
import 'package:shopping_app/src/views/screen/cart_page.dart';
import 'package:shopping_app/src/views/screen/homepage.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/src/views/screen/product_details.dart';
import 'package:shopping_app/src/views/screen/wishlist.dart';

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
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'product/:id',
          name: 'product',
          builder: (context, state) => const ProductDetailPage(),
        ),
        GoRoute(
          path: 'cart',
          name: 'cart',
          builder: (BuildContext context, GoRouterState state) => CartPage(),
        ),
        GoRoute(
          path: 'wishList',
          name: 'wishList',
          builder: (BuildContext context, GoRouterState state) =>
              WishListPage(),
        ),
      ]),
]);
