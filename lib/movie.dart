class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(title: 'Inception', genre: 'Sci-Fi', year: 2010, rating: 8.8, image: 'assets/posters/inception.png'),
  Movie(title: 'Interstellar', genre: 'Sci-Fi', year: 2014, rating: 8.7, image: 'assets/posters/interstellar.png'),
  Movie(title: 'The Dark Knight', genre: 'Action', year: 2008, rating: 9.0, image: 'assets/posters/dark_knight.png'),
  Movie(title: 'Avatar', genre: 'Adventure', year: 2009, rating: 7.9, image: 'assets/posters/avatar.png'),
  Movie(title: 'Titanic', genre: 'Romance', year: 1997, rating: 7.9, image: 'assets/posters/titanic.png'),
  Movie(title: 'Gladiator', genre: 'Action', year: 2000, rating: 8.5, image: 'assets/posters/gladiator.png'),
  Movie(title: 'Toy Story', genre: 'Animation', year: 1995, rating: 8.3, image: 'assets/posters/toy_story.png'),
  Movie(title: 'Joker', genre: 'Drama', year: 2019, rating: 8.4, image: 'assets/posters/joker.png'),
];
