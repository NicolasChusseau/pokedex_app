import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/data/api/pokemon.service.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/cubit/pokemons.state.dart';

class PokemonsCubit extends Cubit<CubitState<List<Pokemon>>> {
  PokemonsCubit() : super(InitialState());

  void getPokemons() async {
    emit(LoadingState());

    try {
      final List<Pokemon> pokemons = await PokemonService.fetchPokemonList();
      emit(SuccessState(data: pokemons));
    } catch (e) {
      emit(FailureState(message: 'Failed to load pokemons'));
    }
  }

  void getPokemonsFilteredByType(String typeName) async {
    emit(LoadingState());

    try {
      final List<Pokemon> pokemons = await PokemonService.fetchPokemonByType(typeName);
      emit(SuccessState(data: pokemons));
    } catch (e) {
      emit(FailureState(message: 'Failed to load pokemons'));
    }
  }


}