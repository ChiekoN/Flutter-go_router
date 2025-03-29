import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';
  static const details = '/details/:index';
  static const add = '/add';
  static const history = '/history';
}

const List<NavigationDestination> destinations = [
  NavigationDestination(
    route: '/',
    label: 'Home',
    icon: Icon(Icons.home),
    index: 0, // BottomNavigationBar index 0
  ),
  NavigationDestination(
    route: '/add',
    label: 'Add',
    icon: Icon(Icons.add),
  ),
  NavigationDestination(
    route: '/details',
    label: 'Details',
  ),
  NavigationDestination(
    route: '/history',
    label: 'History',
    icon: Icon(Icons.history),
    index: 1, // BottomNavigationBar index 1
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    this.icon,
    this.index, // index for BottomNavigationBar. 
                // Must be set only if this page is reached from BottomNavigationBar.
  });

  final String route;
  final String label;
  final Icon? icon;
  final int? index;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: ScaffoldWithBottomNavBar(
          currentIndex: 0, // Should match with destinations[N].index for '/'
          child: TopListPage(),
        ),
      ),
      routes: [
        GoRoute(
          path: 'details/:index',
          pageBuilder: (context, state) => NoTransitionPage(
            child: DateDetailPage(
              id: state.pathParameters['index']
            ),
          ),
        ),
        GoRoute(
          path: 'add',
          pageBuilder: (context, state) => NoTransitionPage(
            child: NewDatePage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/history',
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
    
    // Constract List<BottomNavigationBarItem> by extracting necessary items from `destinations`
    List<NavigationDestination> inNavigation = destinations.where(
      (dest) => dest.index != null
    ).toList();
    inNavigation.sort((a, b) => a.index!.compareTo(b.index!));
    List<BottomNavigationBarItem> navigationItems = inNavigation.map(
      (navItem) {
        return BottomNavigationBarItem(
          icon: navItem.icon!,
          label: navItem.label,
        );
      }
    ).toList();

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // match the tapped index with destination route
          NavigationDestination destination = destinations.firstWhere(
            (dest) => dest.index == index,
          ); 
          context.go(destination.route);
        },
        items: navigationItems, // Items extracted from `destinations`
      ),
      floatingActionButton: currentIndex == 0 ? FloatingActionButton(
        onPressed: () {
          context.go(AppRoutes.add);
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