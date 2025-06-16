import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // return CustomCurvedEdgesWidget(
    //   child: Container(
    //       color: EshopColors.primaryColor,
    //       padding: const EdgeInsets.all(0),
    //       child: SizedBox(
    //         // height: EshopDeviceUtils.getScreenHeight(context) * 0.45,
    //         height: 350,
    //         child: Stack(
    //           children: [
    //             Positioned(
    //               top: -250,
    //               right: -200,
    //               child: CircularContainer(
    //                 backgroundColor: EshopColors.textWhite.withOpacity(0.1),
    //               ),
    //             ),
    //             Positioned(
    //               top: 50,
    //               right: -300,
    //               child: CircularContainer(
    //                 backgroundColor: EshopColors.textWhite.withOpacity(0.1),
    //               ),
    //             ),
    //             child
    //           ],
    //         ),
    //       )
    //   ),
    // );

    return CustomCurvedEdgesWidget(
      child: Container(
          color: EshopColors.primaryColor,
          child: Stack(
              children: [
                Positioned(
                  top: -250,
                  right: -200,
                  child: CircularContainer(
                    backgroundColor: EshopColors.textWhite.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: -300,
                  child: CircularContainer(
                    backgroundColor: EshopColors.textWhite.withOpacity(0.1),
                  ),
                ),
                child
              ],
            ),

      ),
    );
  }
}