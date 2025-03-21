import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/providers/movie_detail_provider.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:movie/widgets/circle_avatar_widget.dart';
import 'package:movie/widgets/youtube_player_widget.dart';
import 'package:provider/provider.dart';

class WatchListDetailsScreen extends StatefulWidget {
  final Movie movie;

  const WatchListDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  State<WatchListDetailsScreen> createState() => _WatchListDetailsScreenState();
}

class _WatchListDetailsScreenState extends State<WatchListDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailProvider()..fetchTrailer(widget.movie.id),
      child: Consumer<MovieDetailProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                    child: Container(
                      color: const Color.fromARGB(255, 58, 57, 57)
                          .withOpacity(0.7),
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 10.w,
                  right: 10.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                              fit: BoxFit.cover,
                              height: 200.h,
                              width: 150.w,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${widget.movie.title}',
                                style: AppTextStyles.mainheadings(14),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Release Date: ${widget.movie.releaseDate}',
                                style: AppTextStyles.mainheadings(13),
                              ),
                              Text(
                                'id : ${widget.movie.id}',
                                style: AppTextStyles.mainheadings(13),
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatarWidget(
                                    icon: Icons.favorite,
                                    iconColor: Colors.red,
                                    onTap: () => print('Like tapped'),
                                  ),
                                  const SizedBox(width: 20),
                                  CircleAvatarWidget(
                                    icon: Icons.thumb_up,
                                    iconColor: Colors.blue,
                                    onTap: () => print('Like tapped'),
                                  ),
                                  const SizedBox(width: 20),
                                  CircleAvatarWidget(
                                    icon: Icons.thumb_down,
                                    iconColor: Colors.orange,
                                    onTap: () => print('Dislike tapped'),
                                  ),
                                  const SizedBox(width: 20),
                                  CircleAvatarWidget(
                                    icon: Icons.share,
                                    iconColor: Colors.green,
                                    onTap: () => print('Share tapped'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              GestureDetector(
                                onTap: () {
                                  if (provider.trailerUrl != null) {
                                    provider.setPlaying(true);
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 150.w),
                                  child: CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage: const AssetImage(
                                        'assets/images/play.gif'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Overview",
                        style: AppTextStyles.mainheadings(18),
                      ),
                      Text(
                        widget.movie.overview,
                        style: AppTextStyles.mainheadings(15),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                if (provider.isPlaying &&
                    provider.youtubePlayerController != null)
                  YoutubePlayerWidget(
                    controller: provider.youtubePlayerController!,
                    onClose: () {
                      provider.setPlaying(false);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
