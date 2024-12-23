import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:video_player/video_player.dart';

class Page1 extends StatefulWidget {
  Page1(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late FlickManager _flickManager;

  @override
  void initState() {
    super.initState();

    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset("assets/bg.mp4")
        ..setLooping(true)
        ..initialize(),
    );
    SizeConfig;

    // Add listener to pause the video when the page is not visible
    widget.pageNotifier.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    widget.pageNotifier.removeListener(_handlePageChange);
    _flickManager.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    if (widget.pageNotifier.value == widget.pageIndex) {
      _flickManager.flickControlManager?.play();
    } else {
      _flickManager.flickControlManager?.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        //* Video
        FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 1,
          child: AspectRatio(
            aspectRatio:
                9 / 16, // Adjust aspect ratio to match vertical landscape
            child: FlickVideoPlayer(
              flickManager: _flickManager,
              flickVideoWithControls: FlickVideoWithControls(),
              flickVideoWithControlsFullscreen: null,
            ),
          ),
        ),
        //* Logo
        FractionallySizedBox(
          heightFactor: 0.85,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.017 * SizeConfig.widthMultiplier),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/Logo.png",
                height: 15.800*SizeConfig.heightMultiplier,width: 33.482*SizeConfig.widthMultiplier,
              ),
            ),
          ),
        ),

        //* Card
        Positioned(
          bottom: 17.089 * SizeConfig.widthMultiplier,
          left: 2.317 * SizeConfig.heightMultiplier,
          right: 2.317 * SizeConfig.heightMultiplier,
          child: Container(
            height: 54.77 * SizeConfig.heightMultiplier,
            width: 17.85 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius:
                  BorderRadius.circular(1.26 * SizeConfig.heightMultiplier),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5.79 * SizeConfig.heightMultiplier,
                  horizontal: 5.580 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    "SAFE\nDISPOSAL,",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Hanken_Medium",
                        fontSize: 5.89 * SizeConfig.heightMultiplier),
                  ),
                  Text(
                    maxLines: 2,
                    "SAFER\nTOMORROW",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Hanken_Bold",
                        fontSize: 5.89 * SizeConfig.heightMultiplier),
                  ),
                  SizedBox(
                    height: 3.160 * SizeConfig.heightMultiplier,
                  ),
                  Button(widget.ontap),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget Button(void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 5.793 * SizeConfig.heightMultiplier,
        width: 53.571 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(3.160 * SizeConfig.heightMultiplier),
          color: const Color.fromARGB(255, 235, 229, 229),
        ),
        child: Center(
          child: Text(
            maxLines: 1,
            "Know More",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Hanken_Medium",
              fontSize: 2.317 * SizeConfig.heightMultiplier,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
