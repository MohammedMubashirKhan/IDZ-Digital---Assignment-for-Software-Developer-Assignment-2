import 'package:flutter/material.dart';

class EmployeeDetail extends StatelessWidget {
  final String name;
  final int age;
  final int salary;

  const EmployeeDetail({
    Key? key,
    required this.name,
    required this.age,
    required this.salary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 20.0,
      color: Colors.grey,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: style,
            ),
            Text(
              age.toString(),
              style: style,
            ),
            Text(
              salary.toString(),
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
