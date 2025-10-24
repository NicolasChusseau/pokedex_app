import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/cubit/pokemons.cubit.dart';
import 'package:pokedex_app/ui/modals/pokemon_card_type.widget.dart';

import '../../data/api/pokemon.service.dart';

class PokemonTypesDialog extends StatelessWidget {
  const PokemonTypesDialog({
    super.key, required this.pokemonCubit,
  });

  final PokemonsCubit pokemonCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<PokemonType>>(
          future: PokemonService.fetchPokemonTypeList(),
          builder: (BuildContext context, AsyncSnapshot<List<PokemonType>> snapshot) {
            if (snapshot.hasData) {
              final List<PokemonType> types = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ) +
                    EdgeInsets.only(
                      bottom: MediaQuery
                          .paddingOf(context)
                          .bottom,
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
                      pokemonCubit.getPokemonsFilteredByType(type.name);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }

  void _loadFilteredDataByType(BuildContext context, String name) {}
}
