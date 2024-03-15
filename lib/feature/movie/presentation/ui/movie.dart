import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.favorite_outline,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
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
