import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
import 'package:expenses_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'flutter course',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'cinema',
      amount: 15.5,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'trip',
      amount: 50,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea:
          true, //this safearea used to find out device camera and other top items affect the ui and give safe space...in scaffold attomaticaly used it...but here we use it seperately
      isScrollControlled: true,
      context: context,
      builder: (cxt) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }
  //context has a metadata information of that widget....here context is a metadata of expense class and cxt is a metadata of showModelBottomSheet
  //this context is not a build method context...its context created by state class automaticaly

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height); //with and height of the device screen
    // print(MediaQuery.of(context).size.width); //the build method execute again every time we adjuct device orientation

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('no expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed:
                _openAddExpenseOverlay, //we use here function as a value so no need to call function like _openAddExpenseOverlay()
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  //expanded limit the available height and width to its child
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),

      // Column(
      //   children: [
      //     Chart(expenses: _registeredExpenses),
      //     Expanded(
      //       child: mainContent,
      //     ),
      //   ],
      // ),
    );
  }
}
