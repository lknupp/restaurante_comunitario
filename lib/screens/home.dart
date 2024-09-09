import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurante_comunitario/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('informações').snapshots(),
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages found!'),
          );
        }

        if (chatSnapshots.hasError) {
          return const Center(
            child: Text('An error occurred!'),
          );
        }

        final infoText = chatSnapshots.data!.docs;

        infoText.sort((a, b) {
          final aData = a.data();
          final bData = b.data();
          if (aData['ref'] == bData['ref']) {
            return bData['indexParagrafo'].compareTo(aData['indexParagrafo']);
          }
          return bData['ref'].compareTo(aData['ref']);
        });

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
          reverse: true,
          itemCount: infoText.length,
          itemBuilder: (ctx, index) {
            final text = infoText[index].data();

            return TextWidget(
              text: text['textoParagrafo'],
              isTitle: text['indexParagrafo'] == 0,
            );
          },
        );
      },
    );
  }
}
