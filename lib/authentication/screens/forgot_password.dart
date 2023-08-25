part of '../authentication.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> with InputValidationMixin {
  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool submitted = false;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.listen(authenticationStateProvider, (previous, state) {
      if (state is AuthenticationLoading) {
        LoadingScreen.instance().show(context: context, text: 'Sending password reset link ...');
      } else {
        LoadingScreen.instance().hide();
      }
      if (state is AuthenticationForgotPasswordFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error ?? 'Failed to send link '),
            behavior: SnackBarBehavior.floating,
            backgroundColor: theme.colorScheme.error,
          ),
        );
      }
    });
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            children: [
              Text(
                'Forgot password?',
                style: theme.textTheme.titleLarge,
              ),
              Text(
                'A password reset link will be sent to the email provided',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: email,
                autovalidateMode: submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (email) {
                  return isEmailValid(email: email!) ? null : 'Enter a valid email address';
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () async {
                  setState(() => submitted = true);

                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await ref.read(authenticationStateProvider.notifier).forgotPassword(
                          email: email.text,
                        );
                  }
                },
                child: const Text('Send link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
