part of 'bottom_navigation_bar_cubit.dart';

enum HomeTab { search, favorite }

@immutable
final  class BottomNavigationBarState extends Equatable {
  final HomeTab tab;

  const BottomNavigationBarState({
    this.tab = HomeTab.search,
  });

  BottomNavigationBarState copyWith(HomeTab? tab) {
    return BottomNavigationBarState(tab: tab ?? this.tab);
  }

  @override
  List<Object?> get props => [tab];
}
