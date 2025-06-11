import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Now Playing...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              return GestureDetector(
                onTap:
                    () => Navigator.pushNamed(
                      context,
                      'details',
                      arguments: 'movie $i',
                    ),
                child: Container(
                  width: 140,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                          placeholder: AssetImage('assets/images/loading.gif'),
                          image: NetworkImage(movies[i].getPosterPath),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        movies[i].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        'Estreno: ${movies[i].releaseDate.toLocal().toString().split(' ')[0]}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
