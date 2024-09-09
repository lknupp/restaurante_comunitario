import 'package:flutter/material.dart';
import 'package:restaurante_comunitario/models/unidade.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:restaurante_comunitario/widgets/restaurante_item_trait.dart';

class RestauranteItem extends StatelessWidget {
  const RestauranteItem({
    super.key,
    required this.unidade,
  });

  final Unidade unidade;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(unidade.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      unidade.nome,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RestauranteItemTrait(
                            icon: Icons.place, label: unidade.endereco),
                        const SizedBox(width: 12),
                        RestauranteItemTrait(
                          icon: Icons.breakfast_dining,
                          label: unidade.temCafe
                              ? 'Possui café da manhã'
                              : 'Não possui café da manhã',
                        ),
                        const SizedBox(width: 12),
                        RestauranteItemTrait(
                          icon: Icons.lunch_dining,
                          label: unidade.temAlmoco
                              ? 'Possui almoço'
                              : 'Não possui almoço',
                        ),
                        RestauranteItemTrait(
                          icon: Icons.dinner_dining,
                          label: unidade.temJantar
                              ? 'Possui jantar'
                              : 'Não possui jantar',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
