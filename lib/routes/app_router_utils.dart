enum Pages {
  home(screenPath: "/", screenName: "HOME"),
  movie(screenPath: "movie/:id/:name", screenName: "MOVIE"),
  error(screenPath: "/error", screenName: "ERROR");

  const Pages({
    required this.screenPath,
    required this.screenName,
  });

  final String screenPath;
  final String screenName;
}
