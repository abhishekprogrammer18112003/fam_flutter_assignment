// ignore_for_file: unused_import

import 'package:fam_assignment/core/app_images.dart';
import 'package:fam_assignment/core/custom_spacers.dart';
import 'package:fam_assignment/core/screen_utils.dart';
import 'package:fam_assignment/features/home/data/home_provider.dart';
import 'package:fam_assignment/features/home/models/hc3_model.dart';
import 'package:fam_assignment/features/home/models/hc6_model.dart';
import 'package:fam_assignment/features/home/models/home_model.dart';
import 'package:fam_assignment/features/home/widgets/cta_buttons.dart';
import 'package:fam_assignment/features/home/widgets/hc1_widget.dart';
import 'package:fam_assignment/features/home/widgets/hc3_widget.dart';
import 'package:fam_assignment/features/home/widgets/hc5_widget.dart';
import 'package:fam_assignment/features/home/widgets/hc6_widget.dart';
import 'package:fam_assignment/features/home/widgets/hc9_widget.dart';
import 'package:fam_assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeProvider>(context, listen: false).getFullData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Provider.of<HomeProvider>(context, listen: false).getFullData();
        });
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true, // Ensures the title is centered
            title: SvgPicture.asset(AppImages.app_logo),
          ),
          body: Consumer<HomeProvider>(builder: ((context, value, child) {
            return !value.isLoading
                ? SingleChildScrollView(
                    child: Container(
                      color: Color.fromARGB(255, 247, 246, 243),
                      child: Column(
                        children: [
                          //hc3 container
                          Hc3Widget(data: value.hc3!),
                          CustomSpacers.height15,

                          //hc6 container
                          Hc6Widget(data: value.hc6!),
                          CustomSpacers.height15,

                          //hc5 container
                          Hc5Widget(data: value.hc5!),
                          CustomSpacers.height6,

                          //hc9 container
                          Hc9Widget(data: value.hc9!),
                          CustomSpacers.height6,

                          //hc1 container
                          Hc1Widget(data: value.hc1!)
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          }))),
    );
  }
}
