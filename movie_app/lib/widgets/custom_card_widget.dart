import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.posterPath});

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage(
        placeholder: AssetImage(
          'assets/images/loading.gif',
        ),
        image: NetworkImage(posterPath), // imagen desde la web TMDB
        fit: BoxFit.cover,
        imageErrorBuilder:
            (context, error, stackTrace) => Image.asset(
              'assets/images/error.jpg',
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}
