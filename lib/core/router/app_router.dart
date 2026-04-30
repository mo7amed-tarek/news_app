import 'package:flutter/material.dart';
import 'package:news_app/core/router/route_names.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/news/presentation/views/news_view.dart';
import 'package:news_app/features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case RouteNames.news:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => NewsView(categoryId: args as String),
        );

      case RouteNames.search:
        return MaterialPageRoute(builder: (_) => const SearchView());

      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
