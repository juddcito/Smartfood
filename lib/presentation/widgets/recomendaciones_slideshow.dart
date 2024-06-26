

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_card/image_card.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';

class RecomendacionesSlideshow extends StatelessWidget {

  final List<Recomendacion> recomendaciones;

  const RecomendacionesSlideshow({super.key, required this.recomendaciones});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.8,
        autoplay: true,
        itemCount: recomendaciones.length,
        itemBuilder: (context, index) {
          final recomendacion = recomendaciones[index];
          return RecomendacionSlide(recomendacion: recomendacion);
        },
      ),
    );
  }
}

class RecomendacionSlide extends StatelessWidget {

  final Recomendacion recomendacion;

  const RecomendacionSlide({
    super.key,
    required this.recomendacion,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        )
      ]
    );

    return GestureDetector(
      onTap:() => context.push('/detalle-platillo', extra: recomendacion),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FillImageCard(
              heightImage: 300,
              tags: [_tag('Para ti', () {})],
              title: Text(recomendacion.nombre, maxLines: 1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
              imageProvider: NetworkImage(recomendacion.foto),
              description: Text('\$${recomendacion.costo}'),
            )
          )
        ),
      ),
    );
  }
}

Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.yellow[700]),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          tag,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }