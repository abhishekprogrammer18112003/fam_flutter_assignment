import 'package:fam_assignment/core/custom_spacers.dart';
import 'package:fam_assignment/core/screen_utils.dart';
import 'package:fam_assignment/features/home/models/hc9_model.dart' as hc9;
import 'package:flutter/material.dart';

class Hc9Widget extends StatefulWidget {
  hc9.Hc9Model data;
  Hc9Widget({super.key, required this.data});

  @override
  State<Hc9Widget> createState() => _Hc9WidgetState();
}

class _Hc9WidgetState extends State<Hc9Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 195.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.data!.cards.length,
          itemBuilder: (context, index) {
            final card = widget.data.cards[index];
              return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AspectRatio(
                  aspectRatio: card.bgImage.aspectRatio!,
                  child: Container(
                    // height: 195.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: SweepGradient(
                          startAngle:
                              (card.bgGradient.angle * (3.141592653589793 / 180)),
                          endAngle: ((card.bgGradient.angle + 180) *
                              (3.141592653589793 / 180)),
                          colors: card.bgGradient.colors
                              .map((color) =>
                                  Color(int.parse('0xff${color.substring(1)}')))
                              .toList(),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
