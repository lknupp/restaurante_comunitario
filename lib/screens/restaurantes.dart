import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_comunitario/models/unidade.dart';
import 'package:restaurante_comunitario/widgets/restaurante_item.dart';

class RestaurantesScreen extends StatelessWidget {
  const RestaurantesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('unidades').snapshots(),
        builder: (ctx, unidadesSnapshots) {
          if (unidadesSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!unidadesSnapshots.hasData ||
              unidadesSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text('Não há restaurantes cadastrados!'),
            );
          }

          if (unidadesSnapshots.hasError) {
            return const Center(
              child: Text('Ocorreu um erro!'),
            );
          }

          final unidades = unidadesSnapshots.data!.docs;

          debugPrint(unidades.toString());

          return ListView.builder(
            itemCount: unidades.length,
            itemBuilder: (ctx, index) {
              Unidade unidade = Unidade(
                idUnidade: unidades[index].id,
                nome: unidades[index]['unidade'],
                endereco: unidades[index]['endereco'],
                telefone: unidades[index]['telefone'],
                imageUrl: unidades[index]['url'],
                temCafe: unidades[index]['temCafe'],
                temAlmoco: unidades[index]['temAlmoco'],
                temJantar: unidades[index]['temJanta'],
              );

              return RestauranteItem(unidade: unidade);
            },
          );
        });
  }
}
