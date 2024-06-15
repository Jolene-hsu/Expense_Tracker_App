import 'package:flutter/material.dart';

List<Map<String,dynamic>> myTransactionsData = [
  {
    'icon': const Icon(Icons.food_bank,color: Colors.white),
    'color': Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '-\$45.00',
    'date': 'Today',
  },
  {
    'icon': const Icon(Icons.shopping_bag,color: Colors.white),
    'color': Colors.purple[900],
    'name': 'Shopping',
    'totalAmount': '-\$500.00',
    'date': 'Today',
  },
  {
    'icon': const Icon(Icons.directions_run_rounded,color: Colors.white),
    'color': Colors.blue[600],
    'name': 'Sport',
    'totalAmount': '-\$250.00',
    'date': 'Yestday',
  },
  {
    'icon': const Icon(Icons.videogame_asset,color: Colors.white),
    'color': Colors.blue[200],
    'name': 'Entertainment',
    'totalAmount': '-\$330.00',
    'date': 'Yestday',
  },
  {
    'icon': const Icon(Icons.directions_bus_outlined,color: Colors.white),
    'color': Colors.teal[400],
    'name': 'Transportation',
    'totalAmount': '-\$20.00',
    'date': 'Yestday',
  }
];
