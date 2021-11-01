import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VericalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const VericalIconButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
