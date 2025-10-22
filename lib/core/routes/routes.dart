// lib/core/routes/routes.dart
import 'package:go_router/go_router.dart';
import '../../presentation/screens/authentication/forget_password_screen.dart';
import '../../presentation/screens/authentication/language_selection.dart';
import '../../presentation/screens/authentication/otp_screen.dart';
import '../../presentation/screens/authentication/password_updated_success_screen.dart';
import '../../presentation/screens/authentication/sign_in_screen.dart';
import '../../presentation/screens/authentication/sign_up_screen.dart';
import '../../presentation/screens/authentication/verify_code.dart';
import '../../presentation/screens/authentication/welcome_screen.dart';
import '../../presentation/screens/data/data_screen.dart';
import '../../presentation/screens/home/create_league/create_private_league/create_private_league_screen.dart';
import '../../presentation/screens/home/create_league/create_private_league/create_private_league_waiting_room_screen.dart';
import '../../presentation/screens/home/create_league/create_private_league/edit_private_league.dart';
import '../../presentation/screens/home/create_league/create_public_league/create_public_league_screen.dart';
import '../../presentation/screens/home/create_league/create_public_league/create_public_league_waiting_room_screen.dart';
import '../../presentation/screens/home/create_league/create_public_league/edit_public_league.dart';
import '../../presentation/screens/home/create_league/create_public_league/my_league_screens_public/fantasy_league_screen.dart';
import '../../presentation/screens/home/create_league/createleaguescreen.dart';
import '../../presentation/screens/home/faq_screen.dart';
import '../../presentation/screens/home/global_league/global_league.dart';
import '../../presentation/screens/home/home.dart';
import '../../presentation/screens/home/join_league/choose_a_league.dart';
import '../../presentation/screens/home/join_league/join_private_league/private_league.dart';
import '../../presentation/screens/home/join_league/join_private_league/privateleaguewaitingroom.dart';
import '../../presentation/screens/home/join_league/join_public_league/publicleaguescreen.dart';
import '../../presentation/screens/home/join_league/join_public_league/publicleaguewaitingroomscreen.dart';
import '../../presentation/screens/home/my_leagues.dart';
import '../../presentation/screens/home/my_match_today.dart';
import '../../presentation/screens/mymatch/my_match_screen.dart';
import '../../presentation/screens/profile setup/profile_setup_screen.dart';
import '../../presentation/screens/profile/password_reset.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/profile/profile_settings.dart';
import '../../presentation/screens/profile/update_password.dart';
import '../../presentation/screens/shop/buy_token.dart';
import '../../presentation/screens/shop/shop_screen.dart';
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
        name: RoutePath.verifyRegistration,
        path: RoutePath.verifyRegistration.addBasePath,
        builder: (context, state) => const VerifyRegistration(email: '',),
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
        name: RoutePath.updatePassword,
        path: RoutePath.updatePassword.addBasePath,
        builder: (context, state) => const ChangePasswordScreen(),
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
        name: RoutePath.myMatchToday,
        path: RoutePath.myMatchToday.addBasePath,
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
      GoRoute(
        name: RoutePath.globalLeagueScreen ,
        path: RoutePath.globalLeagueScreen .addBasePath,
        builder: (context, state) => const GlobalLeagueScreen(),
      ),

      GoRoute(
        name: RoutePath.faqScreen ,
        path: RoutePath.faqScreen .addBasePath,
        builder: (context, state) => const FaqScreen(),
      ),

      /// Shop screen
      GoRoute(
        name: RoutePath.shopScreen,
        path: RoutePath.shopScreen.addBasePath,
        builder: (context, state) => const ShopScreen(),
      ),
      GoRoute(
        name: RoutePath.buyToken,
        path: RoutePath.buyToken.addBasePath,
        builder: (context, state) => const BuyTokenScreen(),
      ),



      /// Profile Screen
      GoRoute(
        name: RoutePath.profileScreen,
        path: RoutePath.profileScreen.addBasePath,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        name: RoutePath.profileSettingsScreen,
        path: RoutePath.profileSettingsScreen.addBasePath,
        builder: (context, state) => const ProfileSettingsScreen(),
      ),
      GoRoute(
        name: RoutePath.passwordReset,
        path: RoutePath.passwordReset.addBasePath,
        builder: (context, state) => const PasswordReset(),
      ),


      /// My league Screen
      GoRoute(
        name: RoutePath.myMatch,
        path: RoutePath.myMatch.addBasePath,
        builder: (context, state) => const MyMatchScreen(),
      ),


      /// data
      GoRoute(
        name: RoutePath.data,
        path: RoutePath.data.addBasePath,
        builder: (context, state) => const DataScreen(),
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