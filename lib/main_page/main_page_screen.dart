import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../authentication/authentication.dart';
import '../dashboard/dashboard.dart';
import '../facilities/facilities.dart';
import '../faults/faults.dart';
import '../loading_screen/loading_screen.dart';
import '../profile/profile.dart';

class MainPageView extends ConsumerStatefulWidget {
  const MainPageView({super.key});

  @override
  ConsumerState createState() => _MainPageViewState();
}

class _MainPageViewState extends ConsumerState<MainPageView> {
  final List<Widget> pages = <Widget>[
    const DashboardView(),
    const FacilitiesView(),
    const FaultReportsView(),
    const ProfileView(),
  ];
  int currentPageIndex = 0;
  final ValueNotifier<int> selectedTab = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.listen(
      authenticationStateProvider,
      (previous, state) {
        if (state is AuthenticationLoading) {
          LoadingScreen.instance().show(context: context, text: 'Signing out of account...');
        } else {
          LoadingScreen.instance().hide();
        }
      },
    );
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(radius: 28),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Todd Nelson', style: theme.textTheme.titleMedium),
                        Text('tello_nii@outlook.com', style: theme.textTheme.bodySmall),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              vertical: -4,
                            ),
                            textStyle: theme.textTheme.bodySmall,
                          ),
                          onPressed: () {},
                          child: const Text('View profile'),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                DrawerTabButton(
                  labelText: 'Dashboard',
                  tabValue: 0,
                  icon: IconlyLight.activity,
                  selectedTabValue: currentPageIndex,
                  selectedTab: selectedTab,
                ),
                DrawerTabButton(
                  labelText: 'Facilities',
                  tabValue: 1,
                  icon: Iconsax.buildings,
                  selectedTabValue: currentPageIndex,
                  selectedTab: selectedTab,
                ),
                DrawerTabButton(
                  labelText: 'Fault reports',
                  tabValue: 2,
                  icon: Iconsax.pen_tool,
                  selectedTabValue: currentPageIndex,
                  selectedTab: selectedTab,
                ),
                // DrawerTabButton(
                //   labelText: 'Profile',
                //   tabValue: 3,
                //   icon: IconlyLight.profile,
                //   selectedTabValue: currentPageIndex,
                //   selectedTab: selectedTab,
                // ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    ),
                    onPressed: () async {
                      await ref.read(authenticationStateProvider.notifier).signOut();
                      print('Printing something');
                    },
                    icon: const Icon(Iconsax.logout),
                    label: const Text('Logout'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: selectedTab,
          builder: (context, index, _) {
            return IndexedStack(index: index, children: pages);
          }),
    );
  }
}

class DrawerTabButton extends StatelessWidget {
  const DrawerTabButton({
    required this.labelText,
    required this.icon,
    required this.tabValue,
    required this.selectedTabValue,
    required this.selectedTab,
    super.key,
  });
  final String labelText;
  final IconData icon;
  final int tabValue;
  final int selectedTabValue;
  final ValueNotifier<int> selectedTab;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: selectedTab.value == tabValue ? theme.primaryColor.withOpacity(0.5) : null,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: () {
        selectedTab.value = tabValue;

        Scaffold.of(context).closeDrawer();
      },
      icon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          icon,
          color: selectedTab.value == tabValue ? theme.primaryColor : const Color(0xFF575757),
        ),
      ),
      label: Text(
        labelText,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: selectedTab.value == tabValue ? theme.colorScheme.onPrimary : null,
        ),
      ),
    );
  }
}
