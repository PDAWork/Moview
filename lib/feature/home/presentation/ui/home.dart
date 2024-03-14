import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/presentation/state/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:movie/feature/home/presentation/ui/pages/favorite_pages.dart';
import 'package:movie/feature/home/presentation/ui/pages/search_pages.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (BottomNavigationBarCubit value) => value.state.tab,
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context
            .read<BottomNavigationBarCubit>()
            .setTab(HomeTab.values[index]),
        currentIndex: selectedTab.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          )
        ],
      ),
      body: IndexedStack(
        index: selectedTab.index,
        children: [
          SearchPages(),
          const FavoritePages(),
        ],
      ),
    );
  }
}
