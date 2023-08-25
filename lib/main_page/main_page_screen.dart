import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:property_management/dashboard/dashboard.dart';
import 'package:property_management/facilities/screens/facilities.dart';
import 'package:property_management/faults/faults.dart';
import 'package:property_management/profile/profile.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        tilePadding: const EdgeInsets.symmetric(horizontal: 24),
        children: const [
          NavigationDrawerDestination(
            icon: Icon(IconlyLight.activity),
            label: Text('Dashboard'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Iconsax.buildings),
            label: Text('Facilities'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Iconsax.pen_tool),
            label: Text('Fault reports'),
          ),
          NavigationDrawerDestination(
            icon: Icon(IconlyLight.profile),
            label: Text('Profile'),
          ),
        ],
      ),
      body: IndexedStack(index: currentPageIndex, children: pages),
    );
  }
}
