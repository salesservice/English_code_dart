import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/sellx_colors.dart';
import '../constants/sellx_images.dart';
import 'statusrequest.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImageAsset.loading, width: 100, height: 100))
        : statusRequest == StatusRequest.offlinefailure
            ? Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Align(
                    child: Text(
                      "Ingen Internett",
                      style: GoogleFonts.baloo2(
                          fontSize: 24, color: Myisellcolors.hoved),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                      alignment: const Alignment(0, 0.1),
                      child: Lottie.asset(ImageAsset.offline,
                          width: 200, height: 200)),
                ],
              )
            : statusRequest == StatusRequest.serverfailure
                ? Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Align(
                        child: Text(
                          "Server 404",
                          style: GoogleFonts.baloo2(
                              fontSize: 24, color: Myisellcolors.hoved),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Align(
                          alignment: const Alignment(0, 0.1),
                          child: Lottie.asset(ImageAsset.server,
                              width: 200, height: 200)),
                    ],
                  )
                : widget;
  }
}

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImageAsset.loading, width: 100, height: 100))
        : statusRequest == StatusRequest.offlinefailure
            ? Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Align(
                    child: Text(
                      "Ingen Internett",
                      style: GoogleFonts.baloo2(
                          fontSize: 24, color: Myisellcolors.hoved),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: const Alignment(0, 0.1),
                      child: Lottie.asset(ImageAsset.offline,
                          width: 200, height: 200)),
                ],
              )
            : statusRequest == StatusRequest.serverfailure
                ? Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Align(
                        child: Text(
                          "Server 404",
                          style: GoogleFonts.baloo2(
                              fontSize: 24, color: Myisellcolors.hoved),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Align(
                          alignment: const Alignment(0, 0.1),
                          child: Lottie.asset(ImageAsset.server,
                              width: 200, height: 200)),
                    ],
                  )
                : statusRequest == StatusRequest.failure
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
                          Align(
                            child: Text(
                              "Ingen Data",
                              style: GoogleFonts.baloo2(
                                  fontSize: 24, color: Myisellcolors.hoved),
                            ),
                          ),
                          Align(
                              alignment: const Alignment(0, 0.1),
                              child: Lottie.asset(
                                ImageAsset.nodata,
                                width: 200,
                                height: 200,
                              )),
                        ],
                      )
                    : widget;
  }
}
