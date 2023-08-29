part of '../facilities.dart';

class FacilitiesView extends ConsumerStatefulWidget {
  const FacilitiesView({super.key});

  @override
  ConsumerState createState() => _FacilitiesViewState();
}

class _FacilitiesViewState extends ConsumerState<FacilitiesView> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
        title: const Text('My properties'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              Text('Occupied'),
              Text('Empty'),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 24),
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
                      const Divider(),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: 4,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          unawaited(
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const AddPropertyView(),
              ),
            ),
          );
        },
        label: const Text('Add a property'),
      ),
    );
  }
}
