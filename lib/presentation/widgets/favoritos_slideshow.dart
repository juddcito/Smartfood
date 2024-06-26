

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_card/image_card.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/widgets/recomendaciones_slideshow.dart';

class FavoritosSlideshow extends StatelessWidget {

  final List<Recomendacion> recomendaciones;

  const FavoritosSlideshow({super.key, required this.recomendaciones});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.8,
        itemCount: recomendaciones.length,
        itemBuilder: (context, index) {
          final recomendacion = recomendaciones[index];
          return RecomendacionSlide(recomendacion: recomendacion);
        },
      ),
    );
  }
}