import 'package:flutter/material.dart';
import 'package:pokedex_app/data/api/pokemon.service.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/pages/pokemon_details.page.dart';

import '../widget/home_header.widget.dart';
import '../widget/pokemon_card.widget.dart';
import '../modals/pokemon_modal.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: PokemonModal(),
      body: FutureBuilder<List<Pokemon>>(
        future: PokemonService.fetchPokemonList(),
        builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if (snapshot.hasData) {
            final List<Pokemon> pokemons = snapshot.data!;
              return SafeArea(
                bottom: false,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: HomeHeaderWidget(),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
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
                          // Ce ratio influence la manière dont l'espace est réparti
                          // entre les dimensions horizontale et verticale.
                          // Exemple :
                          //  - Un ratio de 0.5, le widget [PokemonCardWidget] sera deux fois
                          // plus haut que large.
                          //  - Un ratio de 2, le widget [PokemonCardWidget] sera deux fois
                          // plus large que haut.
                          childAspectRatio: 1.5,
                        ),
                        itemCount: pokemons.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Pokemon pokemon = pokemons.elementAt(index);

                          return InkWell(
                            child: PokemonCardWidget(pokemon: pokemon),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PokemonDetailsPage(pokemon: pokemon),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}