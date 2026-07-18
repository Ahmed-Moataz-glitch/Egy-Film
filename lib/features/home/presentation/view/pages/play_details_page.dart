import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/features/home/data/model/play_model.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:egy_film/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayDetailsPage extends StatefulWidget {
  final PlayModel playModel;
  const PlayDetailsPage({super.key, required this.playModel});

  @override
  State<PlayDetailsPage> createState() => _PlayDetailsPageState();
}

class _PlayDetailsPageState extends State<PlayDetailsPage> {
  late final VideoPlayerController videoPlayerController;
  late final CustomVideoPlayerController customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.playModel.url))
          // VideoPlayerController.asset(AppAssets.testVideo)
          ..initialize().then((_) {
            setState(() {});
            videoPlayerController.play();
          });
    customVideoPlayerController = CustomVideoPlayerController(
      context: navigatorKey.currentContext!,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        showFullscreenButton: true,
        showSeekButtons: true,
        playbackButtonTextStyle: TextStyle(
          color: AppColors.yellow,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        systemUIModeAfterFullscreen: SystemUiMode.immersiveSticky,
        systemUIModeInsideFullscreen: SystemUiMode.immersiveSticky,
      ),
    );
  }

  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.dark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.fillColor),
        ),
        title: Text(
          S.of(context).details_page_app_bar,
          style: TextStyle(
            color: AppColors.fillColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width,
                    child: CachedNetworkImage(
                      imageUrl: widget.playModel.thumbnail,
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray.withAlpha(100),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation(
                                AppColors.yellow,
                              ),
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.32,
                    right: size.width * 0.05,
                    child: Text(
                      widget.playModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.fillColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.325,
                    left: size.width * 0.05,
                    child: Row(
                      spacing: 6.w,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.dateIconImage,
                          width: 18.w,
                          height: 18.h,
                        ),
                        Text(
                          widget.playModel.releaseDate,
                          style: TextStyle(
                            color: AppColors.fillColor.withAlpha(200),
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                          child: VerticalDivider(
                            color: AppColors.fillColor.withAlpha(200),
                            thickness: 1.r,
                            width: 20.r,
                          ),
                        ),
                        Image.asset(
                          AppAssets.durationIconImage,
                          width: 18.w,
                          height: 18.h,
                        ),
                        Text(
                          widget.playModel.duration,
                          style: TextStyle(
                            color: AppColors.fillColor.withAlpha(200),
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                          child: VerticalDivider(
                            color: AppColors.fillColor.withAlpha(200),
                            thickness: 1.r,
                            width: 20.r,
                          ),
                        ),
                        Image.asset(
                          AppAssets.categoryIconImage,
                          width: 18.w,
                          height: 18.h,
                        ),
                        Text(
                          widget.playModel.category,
                          style: TextStyle(
                            color: AppColors.fillColor.withAlpha(200),
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            videoPlayerController.value.isInitialized
                ? Padding(
                    padding: EdgeInsets.all(16.r),
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: CustomVideoPlayer(
                          customVideoPlayerController:
                              customVideoPlayerController,
                        ),
                      ),
                    ),
                  )
                : Container(
                  margin: EdgeInsets.all(16.r),
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.gray.withAlpha(100),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(AppColors.yellow),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
