import 'package:fam_assignment/core/custom_spacers.dart';
import 'package:fam_assignment/core/screen_utils.dart';
import 'package:fam_assignment/features/home/models/hc1_model.dart' as hc1;
import 'package:flutter/material.dart';

class Hc1Widget extends StatefulWidget {
  hc1.Hc1Model data;
  Hc1Widget({super.key, required this.data});

  @override
  State<Hc1Widget> createState() => _Hc1WidgetState();
}

class _Hc1WidgetState extends State<Hc1Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 65.h,
        child: widget.data.isScrollable
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.cards.length,
                itemBuilder: (context, index) {
                  final card = widget.data.cards[index];
                  return _buildCard(card);
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                    widget.data.cards.map((card) => _buildCard1(card)).toList(),
              ),
      ),
    );
  }

  Widget _buildCard(dynamic card) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 65.h,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Color(int.parse('0xff${card.bgColor!.substring(1)}')),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                  aspectRatio: card.icon.aspectRatio.toDouble(),
                  child: Image.network(card.icon.imageUrl)),
              CustomSpacers.width10,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.formattedTitle.entities[0].text,
                    style: TextStyle(
                      color: Color(int.parse(
                          '0xff${card.formattedTitle.entities[0].color?.substring(1)}')),
                      fontFamily: card.formattedTitle.entities[0].fontFamily,
                      decoration: card.formattedTitle.entities[0].fontStyle ==
                              'underline'
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  card!.description == " "
                      ? Text(
                          card.formattedDescription.entities[0].text,
                          style: TextStyle(
                            fontSize: 12.w,
                            color: Color(int.parse(
                                '0xff${card.formattedDescription.entities[0].color?.substring(1)}')),
                            fontFamily: card
                                .formattedDescription.entities[0].fontFamily,
                            decoration: card.formattedDescription.entities[0]
                                        .fontStyle ==
                                    'underline'
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        )
                      : const Text(
                          "",
                          style: TextStyle(fontSize: 0),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard1(dynamic card) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 65.h,
          decoration: BoxDecoration(
            color: Color(int.parse('0xff${card.bgColor!.substring(1)}')),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio:
                      (card.icon.aspectRatio.toDouble() - 0.2).clamp(0.5, 1.5),
                  child: Image.network(
                    card.icon.imageUrl,
                    height: 5.h,
                    fit: BoxFit.contain,
                  ),
                ),
                CustomSpacers.width10,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.formattedTitle.entities[0].text,
                        style: TextStyle(
                          color: Color(int.parse(
                              '0xff${card.formattedTitle.entities[0].color?.substring(1)}')),
                          fontFamily:
                              card.formattedTitle.entities[0].fontFamily,
                          decoration:
                              card.formattedTitle.entities[0].fontStyle ==
                                      'underline'
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      card.description == " "
                          ? Text(
                              card.formattedDescription.entities[0].text,
                              style: TextStyle(
                                fontSize: 12.w,
                                color: Color(int.parse(
                                    '0xff${card.formattedDescription.entities[0].color?.substring(1)}')),
                                fontFamily: card.formattedDescription
                                    .entities[0].fontFamily,
                                decoration: card.formattedDescription
                                            .entities[0].fontStyle ==
                                        'underline'
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : const Text(
                              "",
                              style: TextStyle(fontSize: 0),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
