import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TopListPage(),
      routes: [
        GoRoute(
          path: 'details/:index',
          builder: (context, state) => DateDetailPage(id: state.pathParameters['index']),
        ),
        GoRoute(
          path: 'add',
          builder: (context, state) => NewDatePage(),
        ),
      ],
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => HistoryListPage(),
    ),
  ],
);


//
// TODO: Go to pages later
// 
class TopListPage extends StatefulWidget {
  const TopListPage({super.key});

  @override
  State<TopListPage> createState() => _TopListPageState();
}

class _TopListPageState extends State<TopListPage> {

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

class HistoryListPage extends StatefulWidget {
  const HistoryListPage({super.key});

  @override
  State<HistoryListPage> createState() => _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is History page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}


class DateDetailPage extends StatelessWidget {
  final String? id;
  const DateDetailPage({this.id, super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a detail page for $id',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}


class NewDatePage extends StatefulWidget {
  const NewDatePage({super.key});

  @override
  State<NewDatePage> createState() => _NewDatePageState();
}

class _NewDatePageState extends State<NewDatePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a page to add new date.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}