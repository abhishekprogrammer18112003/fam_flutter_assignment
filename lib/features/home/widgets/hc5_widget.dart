import 'package:fam_assignment/core/custom_spacers.dart';
import 'package:fam_assignment/core/screen_utils.dart';
import 'package:fam_assignment/features/home/models/hc5_model.dart';
import 'package:flutter/material.dart';

class Hc5Widget extends StatefulWidget {
  Hc5Model data;
  Hc5Widget({super.key, required this.data});

  @override
  State<Hc5Widget> createState() => _Hc5WidgetState();
}

class _Hc5WidgetState extends State<Hc5Widget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.data.cards[0].bgImage.aspectRatio,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data!.cards.length,
        itemBuilder: (context, index) {
          final card = widget.data.cards[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: card.bgImage.aspectRatio
                        .toDouble(), 
                    child: Image.network(
                      card.bgImage.imageUrl,
                      fit: BoxFit
                          .cover, 
                    ),
                  ),
                  CustomSpacers.width10,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
