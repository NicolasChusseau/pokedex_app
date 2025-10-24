import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pokedex_app/ui/cubit/pokemons.cubit.dart';
import 'package:pokedex_app/ui/modals/pokemon_types.dialog.dart';

class PokemonModal extends StatelessWidget {
  const PokemonModal({
    super.key,
    required this.pokemonCubit,
  });

  final PokemonsCubit pokemonCubit;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.list_rounded,
      activeIcon: Icons.close,
      backgroundColor: const Color(0xFF6B79DB),
      foregroundColor: Colors.white,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: <SpeedDialChild>[
        SpeedDialChild(
          label: 'Rechercher',
          child: Icon(Icons.search_rounded),
          shape: const CircleBorder(),
          labelStyle: TextStyle(fontSize: 18)
        ),
        SpeedDialChild(
          label: 'Toutes les générations',
          child: Icon(Icons.catching_pokemon_rounded),
          shape: const CircleBorder(),
          labelStyle: TextStyle(fontSize: 18)
        ),
        SpeedDialChild(
          label: 'Tous les types',
          child: Icon(Icons.catching_pokemon_rounded),
          shape: const CircleBorder(),
          labelStyle: TextStyle(fontSize: 18),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return PokemonTypesDialog(pokemonCubit: pokemonCubit,);
              }
            );
          }
        ),
        SpeedDialChild(
          label: 'Favoris',
          child: Icon(Icons.favorite_rounded),
          shape: const CircleBorder(),
          labelStyle: TextStyle(fontSize: 18)
        ),
      ],
    );
  }
}
