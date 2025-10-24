import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/modals/pokemon_card_type.widget.dart';

class PokemonTypesDialog extends StatelessWidget {
  const PokemonTypesDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<PokemonType> types = PokemonType.mockList();
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ) +
            EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom,
            ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemCount: types.length,
        itemBuilder: (BuildContext context, int index) {
          final PokemonType type = types.elementAt(index);

          return InkWell(
            child: PokemonCardTypeWidget(type: type),
            onTap: () {
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
