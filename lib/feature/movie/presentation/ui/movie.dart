import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/movie/domain/use_case.dart/favorite_change_use_case.dart';
import 'package:movie/feature/movie/presentation/state/favorite_change_cubit.dart';
import 'package:movie/feature/movie/presentation/state/movie_cubit.dart';

class Movie extends StatelessWidget {
  const Movie({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          BlocBuilder<FavoriteChangeCubit, FavoriteChangeState>(
            builder: (context, state) {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  final stateMovie = context.read<MovieCubit>().state;
                  if (stateMovie is MovieSeccuss) {
                    context.read<FavoriteChangeCubit>().onChangeFavorite(
                          stateMovie.movie,
                        );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    state.status == FavoriteChangeStatus.select
                        ? Icons.favorite
                        : Icons.favorite_outline,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: BlocConsumer<MovieCubit, MovieState>(
        listener: (context, state) {
          if (state is MovieSeccuss) {
            context.read<FavoriteChangeCubit>().init(state.movie);
          }
        },
        builder: (context, state) {
          return switch (state) {
            MovieInitial() || MovieLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MovieSeccuss(:final movie) => SafeArea(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.network(movie.poster),
                    ),
                    Text("Название: ${movie.name}"),
                    Text("Год выпуска: ${movie.year}"),
                    Text("Количество голосов: ${movie.votesKP}"),
                    Text('Возрастной рейтинг: ${movie.ageRating}+'),
                    Row(
                      children: [
                        const Text("Жанр"),
                        Wrap(
                          children: movie.genres
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                    Text("Общие сборы в мире: ${movie.fees} руб."),
                    Text("Дата премьеры в мире: ${movie.premiere}"),
                    SizedBox(
                      height: 135,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movie.persons.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Image.network(
                                  movie.persons[index].photo,
                                  height: 100,
                                ),
                                Text(
                                  movie.persons[index].name,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Text('Трейлер')
                  ],
                ),
              ),
            MovieError() => const Center(
                child: Text('Ошибка'),
              ),
          };
        },
      ),
    );
  }
}
