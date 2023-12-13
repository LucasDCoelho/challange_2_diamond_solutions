import 'package:desafio_2/screens/adjustment_your_salary.dart';
import 'package:desafio_2/screens/all_numbers_even.dart';
import 'package:desafio_2/screens/all_numbers_until_reach.dart';
import 'package:desafio_2/screens/can_you_vote.dart';
import 'package:desafio_2/screens/day_of_weekend.dart';
import 'package:desafio_2/screens/sum_all_numbers.dart';
import 'package:desafio_2/screens/sum_numbers_less_than_30.dart';
import 'package:flutter/material.dart';

import '../screens/odd_or_even.dart';
import '../screens/the_greater_then.dart';

class DrawerNavBar extends StatefulWidget {
  const DrawerNavBar({super.key});

  @override
  State<DrawerNavBar> createState() => _DrawerNavBarState();
}

class _DrawerNavBarState extends State<DrawerNavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Lucas D. Coelho"),
            accountEmail: const Text("lucasdcoelho@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("images/Lucas.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("É ímpar ou par?"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const OddOrEven()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Qual é maior?"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const TheGreaterThen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Você pode votar?"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const CanYouVote()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Ajuste de salário"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const AdjustmentYourSalary()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Dias da semana"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const DaysOfWeekend()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Numeros até chegar no valor"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const AllNumbersUntilReach()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Soma dos numeros até o valor"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const SumAllNumbers()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Mostrar os numero ímpares"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const AllNumbersEven()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text("Soma dos numeros menor que 30"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const SumNumberLessThan30()));
            },
          ),
        ],
      ),
    );
  }
}
