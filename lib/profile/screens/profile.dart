part of '../profile.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.primaryColor.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Align(alignment: Alignment.centerLeft, child: CircleAvatar(radius: 48)),
                      const SizedBox(height: 12),
                      Text('Todd Nelson', style: theme.textTheme.titleLarge),
                      Text('tello_nii@outlook.com', style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Iconsax.edit),
                  label: const Text('Edit'),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Settings', style: theme.textTheme.titleSmall),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFDFE6E9),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Notifications',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'Security',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'Theme',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFDFE6E9),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Send feedback',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'Rate the app',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'About',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'Terms and conditions',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'Privacy policy',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
                ListTile(
                  title: Text(
                    'Software licenses',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Iconsax.arrow_right_2),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.error),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () async {
                    // await ref.read(authenticationProvider.notifier).signOut();
                  },
                  title: Text(
                    'Sign out',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.error,
                    ),
                  ),
                  trailing: Icon(Iconsax.logout, color: theme.colorScheme.error),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
