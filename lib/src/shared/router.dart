import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'details/:index',
          builder: (context, state) => DateDetail(id: state.pathParameters['index']),
        ),
        GoRoute(
          path: 'add',
          builder: (context, state) => NewDate(),
        ),
      ],
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => HistoryList(),
    ),
  ],
);


//
// TODO: Go to pages later
// 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is Homepage',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}