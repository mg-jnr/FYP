import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_management/database/shared_preference.dart';
import 'package:property_management/main_page/main_page_screen.dart';
import 'package:property_management/onboarding/features/onboarding_states_notifiers.dart';

import 'firebase_options.dart';
import 'onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalPreference.init();
  final ProviderContainer container = ProviderContainer();
  container.read(onboardingProvider.notifier).checkOnboardingState();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const PropertyManagerRoot(),
    ),
  );
}

class PropertyManagerRoot extends StatelessWidget {
  const PropertyManagerRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.light(
        scheme: FlexScheme.money,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 2,
        subThemesData: const FlexSubThemesData(
          blendTextTheme: true,
          textButtonRadius: 8.0,
          filledButtonRadius: 10.0,
          buttonPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          outlinedButtonRadius: 10.0,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          outlinedButtonPressedBorderWidth: 2.0,
          toggleButtonsBorderSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primary,
          segmentedButtonBorderSchemeColor: SchemeColor.primary,
          unselectedToggleIsColored: true,
          sliderValueTinted: true,
          inputDecoratorSchemeColor: SchemeColor.primary,
          inputDecoratorIsFilled: true,
          inputDecoratorBackgroundAlpha: 16,
          inputDecoratorRadius: 12.0,
          inputDecoratorUnfocusedHasBorder: true,
          inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
          popupMenuRadius: 6.0,
          popupMenuElevation: 8.0,
          inputDecoratorUnfocusedBorderIsColored: true,
          inputDecoratorFocusedHasBorder: true,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          menuRadius: 6.0,
          menuElevation: 8.0,
          menuBarRadius: 0.0,
          menuBarElevation: 1.0,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.money,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 8,
        subThemesData: const FlexSubThemesData(
          blendTextTheme: true,
          textButtonRadius: 8.0,
          buttonPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          filledButtonRadius: 10.0,
          outlinedButtonRadius: 10.0,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          outlinedButtonPressedBorderWidth: 2.0,
          toggleButtonsBorderSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primary,
          segmentedButtonBorderSchemeColor: SchemeColor.primary,
          unselectedToggleIsColored: true,
          inputDecoratorUnfocusedBorderIsColored: true,
          inputDecoratorFocusedHasBorder: true,
          sliderValueTinted: true,
          inputDecoratorSchemeColor: SchemeColor.primary,
          inputDecoratorIsFilled: true,
          inputDecoratorBackgroundAlpha: 22,
          inputDecoratorRadius: 12.0,
          inputDecoratorUnfocusedHasBorder: true,
          popupMenuRadius: 6.0,
          popupMenuElevation: 8.0,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          menuRadius: 6.0,
          menuElevation: 8.0,
          menuBarRadius: 0.0,
          menuBarElevation: 1.0,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      home: const RootPageWrapper(),
    );
  }
}

class RootPageWrapper extends ConsumerWidget {
  const RootPageWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardState = ref.watch(onboardingProvider);
    if (onboardState is Authenticated) {
      return const MainPageView();
    } else {
      return const OnboardingView();
    }
  }
}
