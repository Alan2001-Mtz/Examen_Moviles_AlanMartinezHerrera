import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/widgets.dart';

class CustomSwipper extends StatelessWidget {
  const CustomSwipper({ super.key, required this.movies });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.54,
      child: Swiper(
        onTap: (index) => Navigator.pushNamed(context, 'details',arguments: 'la-peli $index'),
        itemBuilder: (context,index){
          return CustomCardImage(posterPath: movies[index].getPosterPath);
        }, 
        itemCount: movies.length,
        itemWidth: 300,
        control: SwiperControl(),
        layout: SwiperLayout.STACK,
        ),
    );
  }
}

