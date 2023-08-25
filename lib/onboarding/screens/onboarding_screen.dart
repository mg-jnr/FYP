part of '../onboarding.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/house.svg'),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              border: Border.all(width: 1, color: theme.colorScheme.primary.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const SignUpView(),
                        ),
                        (route) => route.isFirst,
                      );
                    },
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const LoginView(),
                        ),
                        (route) => route.isFirst,
                      );
                    },
                    child: const Text('Login'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
