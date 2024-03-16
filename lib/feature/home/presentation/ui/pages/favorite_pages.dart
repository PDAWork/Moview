import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/presentation/state/favorite/favorite_cubit.dart';
import 'package:movie/feature/home/presentation/widget/item_movie.dart';

class FavoritePages extends StatelessWidget {
  const FavoritePages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  return switch (state) {
                    FavoriteInitial() => const SizedBox(),
                    FavoriteLoading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    FavoriteSuccess() => ListView.builder(
                        itemCount: state.favorite.length,
                        itemBuilder: (context, index) {
                          return ItemMovie(
                            item: state.favorite[index],
                          );
                        },
                      ),
                    FavoriteError() => const Center(
                        child: Text('Ошибка'),
                      ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
