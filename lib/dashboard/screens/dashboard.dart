part of '../dashboard.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final PageController propertiesController = PageController();
  final PageController faultsController = PageController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Iconsax.category),
        ),
      ),
      body: ListView(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32), children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'GH¢  4000',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onTertiary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Ave Monthly Income',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      '1',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onTertiary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Total properties',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: ShapeDecoration(
            color: theme.colorScheme.tertiaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Maintenance requests',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '3',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Resolved',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        '2',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Total',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Recent request',
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Properties',
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(
          height: 240,
          child: PageView.builder(
              itemCount: 3,
              controller: propertiesController,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PropertyDetailsView(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondary.withOpacity(0.05),
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 16,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://images.pexels.com/photos/2111768/pexels-photo-2111768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '4 bedroom penthouse',
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          'M104 Nii Shai Ababio Street - East Legon, GA',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: propertiesController,
            count: 3,
            effect: JumpingDotEffect(
              activeDotColor: theme.colorScheme.tertiary,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Maintenance requests',
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(
          height: 240,
          child: PageView.builder(
              itemCount: 3,
              controller: faultsController,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PropertyDetailsView(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondary.withOpacity(0.05),
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 16,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://images.pexels.com/photos/2111768/pexels-photo-2111768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '4 bedroom penthouse',
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          'M104 Nii Shai Ababio Street - East Legon, GA',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: faultsController,
            count: 3,
            effect: JumpingDotEffect(
              activeDotColor: theme.colorScheme.tertiary,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        )
      ]),
    );
  }
}
