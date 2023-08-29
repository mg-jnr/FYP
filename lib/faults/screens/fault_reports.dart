part of '../faults.dart';

class FaultReportsView extends ConsumerStatefulWidget {
  const FaultReportsView({super.key});

  @override
  ConsumerState createState() => _FaultReportsViewState();
}

class _FaultReportsViewState extends ConsumerState<FaultReportsView> with SingleTickerProviderStateMixin {
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
        title: const Text('Fault reports'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              Text('Pending'),
              Text('Fixed'),
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FaultDetailsView(),
                  ));
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
                      Stack(
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
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer.withOpacity(1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text('Fixed'),
                            ),
                          )
                        ],
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
                        'Water faucets damaged',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
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
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: const Text('Report a fault'),
      // ),
    );
  }
}
