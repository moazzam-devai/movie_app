import 'package:movie/constants/app_assets.dart';

class Onboarding {
  String bgImage;
  String title;
  String info;

  Onboarding({
    required this.bgImage,
    required this.title,
    required this.info,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.kOnboardingFirst,
    title: 'Discover the Latest Blockbusters',
    info:
        'Stay updated with the latest movies, trailers, and exclusive previews. Explore trending films from all genres.',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingSecond,
    title: 'Your Personalized Watchlist',
    info:
        'Create and manage your own watchlist. Never miss a movie you want to see with our curated recommendations.',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingThird,
    title: 'Book Tickets Instantly',
    info:
        'Experience seamless ticket booking. Find showtimes, choose your seats, and book your tickets with ease.',
  ),
];
