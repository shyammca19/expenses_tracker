import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              //style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                //16.2343 => 16.23
                const Spacer(),
                Row(
                  children: [
                    //const Icon(Icons.punch_clock),
                    //Text(expense.date.toString()),
                    Icon(categoryIcon[expense.category]),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(expense
                        .formattedDate), //no need to use () because its a getter
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
