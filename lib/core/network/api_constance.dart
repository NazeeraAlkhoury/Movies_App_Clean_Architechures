class ApiConstance {
  static const String apiKey = 'fc6855bc777f325b52017f0e05b6dacb';

  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviePath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String movieDetialsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationsPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
}

 // https://image.tmdb.org/t/p/w500/


// https://api.themoviedb.org/3/movie/238?api_key=fc6855bc777f325b52017f0e05b6dacb
 // https://image.tmdb.org/t/p/w500/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg

// https://api.themoviedb.org/3/movie/top_rated?api_key=fc6855bc777f325b52017f0e05b6dacb

// https://api.themoviedb.org/3/movie/popular?api_key=fc6855bc777f325b52017f0e05b6dacb

// https://api.themoviedb.org/3/movie/238?api_key=fc6855bc777f325b52017f0e05b6dacb


// https://api.themoviedb.org/3/movie/536554/recommendations?api_key=fc6855bc777f325b52017f0e05b6dacb