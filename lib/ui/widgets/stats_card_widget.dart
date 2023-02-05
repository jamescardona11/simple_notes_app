import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    this.onTap,
    Key? key,
    required this.color,
    required this.label,
    this.taskLength = 0,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final int taskLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$label: $taskLength',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
