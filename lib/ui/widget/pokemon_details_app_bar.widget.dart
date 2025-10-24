import 'package:flutter/material.dart';

import '../../data/models/pokemon.model.dart';

class PokemonDetailsAppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  const PokemonDetailsAppBarWidget({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Size get preferredSize => const Size.fromHeight(250);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, top: 20, left: 10, right: 10),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
              style: IconButton.styleFrom(
                iconSize: 20,
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            )
          ),
          Expanded(
            child: Hero(
              tag: 'pokemon_image_${pokemon.pokedexId}',
              child: FadeInImage.assetNetwork(
                placeholder: 'Image loading...',
                image: pokemon.image,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child:
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {
                // TODO: implement
              },
              style: IconButton.styleFrom(
                iconSize: 35
                ),
            )
          )
        ]
      ),
    );
  }

}
