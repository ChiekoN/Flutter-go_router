import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';
  static const add = 'add';
  static const details = 'details';
  static const history = '/history';
}

const List<NavigationDestinationRoute> destinations = [
  NavigationDestinationRoute(
    route: AppRoutes.home,
    label: 'Home',
    icon: Icon(Icons.home),
  ),
  NavigationDestinationRoute(
    route: AppRoutes.history,
    label: 'History',
    icon: Icon(Icons.history),
  ),
];

class NavigationDestinationRoute {
  const NavigationDestinationRoute({
    required this.route,
    required this.label,
    required this.icon,
  });

  final String route;
  final String label;
  final Icon icon;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => NoTransitionPage(
        child: ScaffoldWithBottomNavBar(
          currentIndex: 0, // Should match with destinations[N].index for '/'
          child: TopListPage(),
        ),
      ),
      routes: [
        GoRoute(
          path: AppRoutes.add,
          pageBuilder: (context, state) => NoTransitionPage(
            child: NewDatePage(),
          ),
        ),
        GoRoute(
          path: '${AppRoutes.details}/:index',
          pageBuilder: (context, state) => NoTransitionPage(
            child: DateDetailPage(
              id: state.pathParameters['index']
            ),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.history,
      pageBuilder: (context, state) => NoTransitionPage(
        child: ScaffoldWithBottomNavBar(
          currentIndex: 1, // Should match with destinations[N].index for '/history'
          child: HistoryListPage(),
        ),
      ),
    ),
  ],
);


//
// TODO: Go to under shared/views later
//
class ScaffoldWithBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const ScaffoldWithBottomNavBar({
    Key? key, 
    required this.currentIndex,
    required this.child
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: destinations.map(
          (dest) => NavigationDestination(
            icon: dest.icon, 
            label: dest.label
          )
        ).toList(),
        onDestinationSelected: (int index) {
          context.go(destinations[index].route);
        },
      ),
      floatingActionButton: currentIndex == 0 ? FloatingActionButton(
        onPressed: () {
          context.go('/${AppRoutes.add}');
        },
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is Homepage',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(AppRoutes.home);
        },
        child: const Icon(Icons.close),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(AppRoutes.home);
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}