

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/providers/recomendaciones/recomendaciones_provider.dart';
import 'package:smartfood/presentation/widgets/recomendaciones_slideshow.dart';

class RecomendacionesVerTodasScreen extends ConsumerWidget {
  const RecomendacionesVerTodasScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final recomendaciones = ref.watch(recomendacionesProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text('Tus recomendaciones'),
        centerTitle: true,
        actions: [
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: recomendaciones.length,
                itemBuilder:(context, index) {
                  final recomendacion = recomendaciones[index];
                  return RecomendacionSlide(recomendacion: recomendacion);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}