import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late FlickManager _flickManager;
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;

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

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _positionAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
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
                "assets/icon.png",
                height: 15.800 * SizeConfig.heightMultiplier,
                width: 33.482 * SizeConfig.widthMultiplier,
              ),
            ),
          ),
        ),

        //* Card
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _positionAnimation.value),
              child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.70,
                    widthFactor: 0.9,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 7 * SizeConfig.heightMultiplier),
                      height: 54.77 * SizeConfig.heightMultiplier,
                      width: 17.85 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(
                            1.5 * SizeConfig.heightMultiplier),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.580 * SizeConfig.widthMultiplier),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5 * SizeConfig.heightMultiplier,
                            ),
                            Text(
                              maxLines: 2,
                              AppLocalizations.of(context)!.page_1_header_1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Medium",
                                  fontSize: 5.89 * SizeConfig.heightMultiplier),
                            ),
                            Text(
                              maxLines: 2,
                              AppLocalizations.of(context)!.page_1_header_2,
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
                  )),
            );
          },
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
            AppLocalizations.of(context)!.page_1_button,
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
