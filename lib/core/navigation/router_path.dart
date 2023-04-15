import 'package:word_couch/features/challenge/presentation/pages/challenge_page.dart';
import 'package:word_couch/features/challenge/presentation/pages/challenge_settings_page.dart';
import 'package:word_couch/features/profile/presentation/pages/profile_page.dart';
import 'package:word_couch/features/word_information/presentation/pages/word_information_page.dart';
import 'package:word_couch/features/word_search/presentation/pages/main_page.dart';

abstract class RouterPathContainer {
  static String mainPage = '/';

  static String challengePage = '/challenge';
  static String challengeSettingsPage = '/challenge_settings';

  static String profilePage = '/profile';

  static String wordInformationPage = '/word_information';

  static final routes = {
    mainPage: (context) => const MainPage(),
    challengePage: (context) => const ChallengePage(),
    challengeSettingsPage: (context) => const ChallengeSettingsPage(),
    profilePage: (context) => const ProfilePage(),
    wordInformationPage: (context) => WordInformationPage(),
  };
}
