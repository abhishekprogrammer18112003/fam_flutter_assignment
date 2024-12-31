import 'package:fam_assignment/core/app_images.dart';
import 'package:fam_assignment/core/custom_spacers.dart';
import 'package:fam_assignment/core/screen_utils.dart';
import 'package:fam_assignment/features/home/models/hc3_model.dart' as hc3;
import 'package:fam_assignment/features/home/widgets/cta_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hc3Widget extends StatefulWidget {
  hc3.Hc3Model data;
  Hc3Widget({super.key, required this.data});

  @override
  State<Hc3Widget> createState() => _Hc3WidgetState();
}

class _Hc3WidgetState extends State<Hc3Widget> {
  bool isLongPressed = false;
  bool isRemindLater = false;
  bool isDismiss = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDismiss = prefs.getBool('isDismiss') ?? false;
    });
    print(isDismiss);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          if (isLongPressed) {
            isLongPressed = false;
          } else {
            isLongPressed = true;
          }
          print(isLongPressed);
        });
      },
      child: !isRemindLater && !isDismiss ? state() : Container(),
    );
  }

  state() => Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Container(
          height: double.parse(widget.data!.height.toString()).h - 130.h,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLongPressed
                  ? SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //REMIND LATER BUTTON
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isRemindLater = true;
                              });
                            },
                            child: Container(
                              height: 75.h,
                              width: 72.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.RemindLater),
                                  CustomSpacers.height6,
                                  Text(
                                    "Remind Later",
                                    style: TextStyle(fontSize: 13.h),
                                  )
                                ],
                              ),
                            ),
                          ),
                          CustomSpacers.height34,

                          //DISMISS BUTTON
                          GestureDetector(
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isDismiss', true);
                              setState(() {
                                isDismiss = prefs.getBool('isDismiss')!;
                              });
                              print(isDismiss);
                            },
                            child: Container(
                              height: 75.h,
                              width: 72.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.Dismiss),
                                  CustomSpacers.height6,
                                  Text(
                                    "Dismiss",
                                    style: TextStyle(fontSize: 13.h),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              isLongPressed ? CustomSpacers.width10 : CustomSpacers.width4,
              state2(),
            ],
          ),
        ),
      );

  state2() => SizedBox(
        height: double.parse(widget.data!.height.toString()).h - 130.h,
        width: !isLongPressed
            ? MediaQuery.of(context).size.width * 0.87
            : MediaQuery.of(context).size.width * 0.64,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.vertical,
          itemCount: widget.data.cards.length,
          itemBuilder: (context, index) {
            final card = widget.data.cards[index];
            return Container(
              height: double.parse(widget.data.height.toString()).h - 135.h,
              width: !isLongPressed
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.64,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: NetworkImage(card.bgImage.imageUrl),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSpacers.height80,
                    CustomSpacers.height80,
                    parseFormattedText(
                      card.formattedTitle.text,
                      card.formattedTitle.entities,
                    ),
                    CustomSpacers.height40,
                    CTAButton(
                        text: card.cta[0].text,
                        bgColor: card.cta[0].bgColor,
                        isCircular: card.cta[0].isCircular,
                        isSecondary: card.cta[0].isSecondary,
                        strokeWidth: card.cta[0].strokeWidth.toDouble())
                  ],
                ),
              ),
            );
          },
        ),
      );

  Widget parseFormattedText(String text, List<hc3.Entities> entities) {
    final parts = text.split('{}'); // Split the text at each placeholder
    List<InlineSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      // Add plain text part
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            height: 1.5.h,
            color: Colors.white,
            fontSize: 30.h,
          ),
        ));
      }

      // Add entity part if available
      if (i < entities.length) {
        if (i == entities.length - 1) {
          // Last entity with space above
          spans.add(WidgetSpan(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h), // Add spacing above the last entity
                Text(
                  entities[i].text,
                  style: TextStyle(
                    color: Color(
                        int.parse('0xff${entities[i].color?.substring(1)}')),
                    fontSize: entities[i].fontSize?.toDouble().h,
                    fontFamily: entities[i].fontFamily,
                    decoration: entities[i].fontStyle == 'underline'
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ));
        } else {
          // Regular entity
          spans.add(TextSpan(
            text: entities[i].text,
            style: TextStyle(
              color: Color(int.parse('0xff${entities[i].color?.substring(1)}')),
              fontSize: entities[i].fontSize?.toDouble().h,
              fontFamily: entities[i].fontFamily,
              decoration: entities[i].fontStyle == 'underline'
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ));
        }
      }
    }

    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(children: spans),
    );
  }
}
