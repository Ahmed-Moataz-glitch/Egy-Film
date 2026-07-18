// import 'package:chewie/chewie.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailersWidget extends StatefulWidget {
  final String trailerId;
  final int trailersCount;
  const TrailersWidget({super.key, required this.trailerId, required this.trailersCount});

  @override
  State<TrailersWidget> createState() => _TrailersWidgetState();
}

class _TrailersWidgetState extends State<TrailersWidget> {
  // late final VideoPlayerController videoPlayerController;
  // late final ChewieController chewieController;
  late final YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    // videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.trailerId));
    // chewieController = ChewieController(
    //   videoPlayerController: videoPlayerController,
    //   autoInitialize: true,
    //   autoPlay: false,
    //   looping: false,
    // );
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.trailerId,
      flags: const YoutubePlayerFlags(
        controlsVisibleAtStart: true,
        autoPlay: false,
        loop: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // chewieController.dispose();
    // videoPlayerController.dispose();
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return Container(
      width: widget.trailersCount == 1 ? size.width * 0.92 : size.width * 0.8,
      margin: isArabic ? EdgeInsets.only(left: 16.w) : EdgeInsets.only(right: 16.w),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16.r),
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
            bottomActions: const [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                  playedColor: AppColors.yellow,
                  handleColor: AppColors.yellow,
                ),
              ),
              RemainingDuration(),
              FullScreenButton(color: AppColors.yellow),
            ],
          ),
          builder: (context, player) {
            return AspectRatio(aspectRatio: 16 / 9, child: player);
          },
        ),
      ),
    );
  }
}
