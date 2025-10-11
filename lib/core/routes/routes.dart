// lib/core/routes/routes.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/authentication/forget_password_screen.dart';
import '../../presentation/screens/authentication/language_selection.dart';
import '../../presentation/screens/authentication/otp_screen.dart';
import '../../presentation/screens/authentication/password_updated_success_screen.dart';
import '../../presentation/screens/authentication/reset_confirm_screen.dart';
import '../../presentation/screens/authentication/sign_in_screen.dart';
import '../../presentation/screens/authentication/sign_up_screen.dart';
import '../../presentation/screens/authentication/update_password_screen.dart';
import '../../presentation/screens/authentication/welcome_screen.dart';
import '../../presentation/screens/home/choose_a_league.dart';
import '../../presentation/screens/home/create_league/create_private_league/create_private_league_screen.dart';
import '../../presentation/screens/home/create_league/create_private_league/create_private_league_waiting_room_screen.dart';
import '../../presentation/screens/home/create_league/create_private_league/edit_private_league.dart';
import '../../presentation/screens/home/create_league/create_public_league/create_public_league_screen.dart';
import '../../presentation/screens/home/create_league/create_public_league/create_public_league_waiting_room_screen.dart';
import '../../presentation/screens/home/create_league/create_public_league/edit_public_league.dart';
import '../../presentation/screens/home/create_league/create_public_league/my_league_screens_public/select_player_screen.dart';
import '../../presentation/screens/home/create_league/createleaguescreen.dart';
import '../../presentation/screens/home/home.dart';
import '../../presentation/screens/home/my_leagues.dart';
import '../../presentation/screens/home/my_match_today.dart';
import '../../presentation/screens/home/private_league.dart';
import '../../presentation/screens/home/privateleaguewaitingroom.dart';
import '../../presentation/screens/home/publicleaguescreen.dart';
import '../../presentation/screens/home/publicleaguewaitingroomscreen.dart';
import '../../presentation/screens/profile setup/profile_setup_screen.dart';
import 'route_observer.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.languageScreen.addBasePath,
    debugLogDiagnostics: true,
    routes: [

      /// Authentication
      GoRoute(
        name: RoutePath.languageScreen,
        path: RoutePath.languageScreen.addBasePath,
        builder: (context, state) => const LanguageSelectionScreen(),
      ),
      GoRoute(
        name: RoutePath.welcomeScreen,
        path: RoutePath.welcomeScreen.addBasePath,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: RoutePath.signInScreen,
        path: RoutePath.signInScreen.addBasePath,
        builder: (context, state) => const SignInScreen(),
      ),

      GoRoute(
        name: RoutePath.signUp,
        path: RoutePath.signUp.addBasePath,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: RoutePath.forgetPassword,
        path: RoutePath.forgetPassword.addBasePath,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        name: RoutePath.otpScreen,
        path: RoutePath.otpScreen.addBasePath,
        builder: (context, state) {
          return const OtpScreen(email: '');
        },
      ),

      GoRoute(
        name: RoutePath.passwordReset,
        path: RoutePath.passwordReset.addBasePath,
        builder: (context, state) => const PasswordResetScreen(),
      ),
      GoRoute(
        name: RoutePath.updatePassword,
        path: RoutePath.updatePassword.addBasePath,
        builder: (context, state) => const UpdatePasswordScreen(),
      ),
      GoRoute(
        name: RoutePath.success,
        path: RoutePath.success.addBasePath,
        builder: (context, state) => const SuccessScreen(),
      ),


      /// Profile Setup
      GoRoute(
        name: RoutePath.profileSetup,
        path: RoutePath.profileSetup.addBasePath,
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      /// Home
      GoRoute(
        name: RoutePath.home,
        path: RoutePath.home.addBasePath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: RoutePath.myLeague,
        path: RoutePath.myLeague.addBasePath,
        builder: (context, state) => const MyLeaguesScreen(),
      ),
      GoRoute(
        name: RoutePath.myMatch,
        path: RoutePath.myMatch.addBasePath,
        builder: (context, state) => const MyMatchesTodayScreen(),
      ),
      GoRoute(
        name: RoutePath.createLeagueScreen,
        path: RoutePath.createLeagueScreen.addBasePath,
        builder: (context, state) => const CreateLeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.createPrivateLeagueScreen,
        path: RoutePath.createPrivateLeagueScreen.addBasePath,
        builder: (context, state) => const CreatePrivateLeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.editPrivateLeagueScreen,
        path: RoutePath.editPrivateLeagueScreen.addBasePath,
        builder: (context, state) => const EditPrivateLeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.createPrivateLeagueWaitingRoomScreen,
        path: RoutePath.createPrivateLeagueWaitingRoomScreen.addBasePath,
        builder: (context, state) => const CreatePrivateLeagueWaitingRoomScreen(),
      ),
      GoRoute(
        name: RoutePath.createPublicLeagueScreen,
        path: RoutePath.createPublicLeagueScreen.addBasePath,
        builder: (context, state) => const CreatePublicLeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.editPublicLeagueScreen,
        path: RoutePath.editPublicLeagueScreen.addBasePath,
        builder: (context, state) => const EditPublicLeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.createPublicLeagueWaitingRoomScreen,
        path: RoutePath.createPublicLeagueWaitingRoomScreen.addBasePath,
        builder: (context, state) => const CreatePublicLeagueWaitingRoomScreen(),
      ),
      GoRoute(
        name: RoutePath.chooseALeagueScreen,
        path: RoutePath.chooseALeagueScreen.addBasePath,
        builder: (context, state) => const ChooseALeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.privateLeagueScreen,
        path: RoutePath.privateLeagueScreen.addBasePath,
        builder: (context, state) => const PrivateLeagueScreen(),
      ),
      GoRoute(
        name: RoutePath.publicLeagueScreen,
        path: RoutePath.publicLeagueScreen.addBasePath,
        builder: (context, state) => const ExploreLeaguesScreen(),
      ),
      GoRoute(
        name: RoutePath.publicLeagueWaitingRoomScreen,
        path: RoutePath.publicLeagueWaitingRoomScreen.addBasePath,
        builder: (context, state) => const PublicLeagueWaitingRoomScreen(),
      ),
      GoRoute(
        name: RoutePath.privateLeagueWaitingRoomScreen,
        path: RoutePath.privateLeagueWaitingRoomScreen.addBasePath,
        builder: (context, state) => const PrivateLeagueWaitingRoomScreen(),
      ),
      GoRoute(
        name: RoutePath.selectPlayerScreen ,
        path: RoutePath.selectPlayerScreen .addBasePath,
        builder: (context, state) => const FantasyLeagueScreen(),
      ),

      /// Scan Menu
      GoRoute(
        name: RoutePath.scanMenu,
        path: RoutePath.scanMenu.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.body,
        path: RoutePath.body.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultAll,
        path: RoutePath.scanResultAll.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultSafe,
        path: RoutePath.scanResultSafe.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultModify,
        path: RoutePath.scanResultModify.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultAvoid,
        path: RoutePath.scanResultAvoid.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultBuildMyPlate,
        path: RoutePath.scanResultBuildMyPlate.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultOrderingTips,
        path: RoutePath.scanResultOrderingTips.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.scanResultSaveYourMeals,
        path: RoutePath.scanResultSaveYourMeals.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.myQrCode,
        path: RoutePath.myQrCode.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),

      /// Chat Bot
      GoRoute(
        name: RoutePath.askChatBot,
        path: RoutePath.askChatBot.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),


      /// Profile & Settings
      GoRoute(
        name: RoutePath.myProfile,
        path: RoutePath.myProfile.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.switchProfile,
        path: RoutePath.switchProfile.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.editProfile,
        path: RoutePath.editProfile.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.notification,
        path: RoutePath.notification.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.helpAndSupport,
        path: RoutePath.helpAndSupport.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.accountSettings,
        path: RoutePath.accountSettings.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.changePassword,
        path: RoutePath.changePassword.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.termsAndCondition,
        path: RoutePath.termsAndCondition.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.privacyPolicy,
        path: RoutePath.privacyPolicy.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        name: RoutePath.aboutUs,
        path: RoutePath.aboutUs.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),

      /// Subscription
      GoRoute(
        name: RoutePath.subscription,
        path: RoutePath.subscription.addBasePath,
        builder: (context, state) => const Placeholder(),
      ),
    ],
    observers: [routeObserver],
  );

  static GoRouter get route => initRoute;
}

// Extension for base path
extension BasePathExtension on String {
  String get addBasePath => '/$this';
}