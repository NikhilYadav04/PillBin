import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/Logo.png",
                scale: 3.1,
              ),
            ),
          ),
        ),

        //* Card
        Positioned(
          bottom: 90,
          left: 22,
          right: 22,
          child: Container(
            height: 520,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SAFE\nDISPOSAL,",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Hanken_Medium",
                        fontSize: 56),
                  ),
                  const Text(
                    "SAFER\nTOMORROW",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Hanken_Bold",
                        fontSize: 56),
                  ),
                  const SizedBox(
                    height: 30,
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
        height: 55,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 235, 229, 229),
        ),
        child: const Center(
          child: Text(
            "Know More",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Hanken_Medium",
              fontSize: 22,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
