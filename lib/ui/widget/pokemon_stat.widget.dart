import 'package:flutter/material.dart';

class PokemonStatWidget extends StatelessWidget {

  const PokemonStatWidget({
    super.key,
    required this.name,
    required this.stat,
    required this.color
  });

  final String name;
  final int stat;
  final Color color;
  final int maxStat = 255;

@override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(name),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text((stat+50).toString(), textAlign: TextAlign.center),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(5),
            value: stat / maxStat,
            color: color,
            backgroundColor: Colors.grey[300],
            minHeight: 10,
          ),
        )
      ],
    );
  }
}
