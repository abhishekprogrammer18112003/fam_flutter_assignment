import 'package:fam_assignment/core/custom_spacers.dart';
import 'package:fam_assignment/core/network_helpers.dart';
import 'package:fam_assignment/core/screen_utils.dart';
import 'package:fam_assignment/features/home/models/hc6_model.dart' as hc6;
import 'package:flutter/material.dart';

class Hc6Widget extends StatefulWidget {
  hc6.Hc6Model data;
  Hc6Widget({super.key , required this.data});

  @override
  State<Hc6Widget> createState() => _Hc6WidgetState();
}

class _Hc6WidgetState extends State<Hc6Widget> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.h,
        child: ListView.builder(
          itemCount: widget.data!.cards.length,
          itemBuilder: (context, index) {
            final card = widget.data.cards[index];
            return GestureDetector(
              onTap: (){
                 NetworkHelpers.launchUrl(
                            url: widget.data.cards[index].url,
                            errorCallback: () {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(int.parse('0xff${card.bgColor.substring(1)}')),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0.w, right : 5.w  , top: 15.h , bottom: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: card.icon.aspectRatio
                                  .toDouble(), 
                              child: Image.network(
                                card.icon.imageUrl,
                                fit: BoxFit
                                    .cover,
                              ),
                            ),
                            CustomSpacers.width10,
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
                            )
                          ],
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const  Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}