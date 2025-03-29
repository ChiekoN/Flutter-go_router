import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/router.dart';

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