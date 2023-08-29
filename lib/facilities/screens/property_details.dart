part of '../facilities.dart';

class PropertyDetailsView extends ConsumerStatefulWidget {
  const PropertyDetailsView({super.key});

  @override
  ConsumerState createState() => _PropertyDetailsViewState();
}

class _PropertyDetailsViewState extends ConsumerState<PropertyDetailsView> {
  final List<String> availableServices = [
    'kitchen',
    'Washing machine',
    'Wifi access',
    'House keeping',
    'Air condition',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fault details'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
          const SizedBox(height: 16),
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
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            "Extras",
            style: theme.textTheme.titleSmall,
          ),
          Wrap(
            spacing: 8,
            children: List.generate(
              availableServices.length,
              (index) => Chip(
                padding: const EdgeInsets.symmetric(),
                label: Text(availableServices[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
