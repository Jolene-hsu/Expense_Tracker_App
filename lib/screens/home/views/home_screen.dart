import 'dart:math';
import 'dart:ui';

import 'package:expense_repository/expense_repository.dart';
import 'package:firstapp/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:firstapp/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:firstapp/screens/add_expense/views/add_expense.dart';
import 'package:firstapp/screens/home/views/main_screen.dart';
import 'package:firstapp/screens/stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen>{
  int index = 0;
  late Color selectedItem = Color.fromARGB(255, 61, 106, 84);
  Color unselectedItem = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            index = value;
          });
          print(value);
        },
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 3,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: index == 0 ? selectedItem : unselectedItem,
              ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.graph_square_fill,
              color: index == 1 ? selectedItem : unselectedItem,
              ),
            label: 'Stats'
          )
        ],
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => CreateCategoryBloc(FirebaseExpenseRepo()),
                  ),
                  BlocProvider(
                    create: (context) => GetCategoriesBloc(FirebaseExpenseRepo())..add(
                      GetCategories()
                      ),
                    ),
                  ],
                  child: const AddExpense(),
                )
              ) 
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            CupertinoIcons.add,
            color: Color.fromARGB(255, 202, 201, 201),
          ),
        ),
      ),
      body: index == 0
        ? MainScreen()
        : StatsScreen()
    ); 
  }
}