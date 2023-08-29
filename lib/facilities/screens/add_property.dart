part of '../facilities.dart';

class AddPropertyView extends ConsumerStatefulWidget {
  const AddPropertyView({super.key});

  @override
  ConsumerState createState() => _AddPropertyViewState();
}

class _AddPropertyViewState extends ConsumerState<AddPropertyView> {
  final TextEditingController type = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController rooms = TextEditingController();
  final ValueNotifier<List<String>> services = ValueNotifier([]);
  final ValueNotifier<XFile?> image = ValueNotifier(null);

  final ValueNotifier<bool> formIsValid = ValueNotifier(false);

  final List<String> availableServices = [
    'kitchen',
    'Washing machine',
    'Wifi access',
    'House keeping',
    'Air condition',
  ];
  void formValidator() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add property'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              children: [
                TextFormField(
                  controller: type,
                  decoration: const InputDecoration(
                    labelText: 'Property type',
                    hintText: 'Office space',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: address,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: '',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: rooms,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Rooms',
                    hintText: 'Eg. 3 bedroom apartment',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Extras (Select all that apply)'),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                    valueListenable: services,
                    builder: (context, service, _) {
                      return ChipsChoice<String>.multiple(
                        value: service,
                        wrapped: true,
                        choiceCheckmark: true,
                        padding: EdgeInsets.zero,
                        runSpacing: 12,
                        spacing: 8,
                        onChanged: (val) {
                          services.value = val;
                          formValidator();
                        },
                        choiceItems: C2Choice.listFrom<String, String>(
                          source: availableServices,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                      );
                    }),
                const SizedBox(height: 12),
                const Text('Property Image'),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    image.value = await ImagePickerUtil.openGallery();
                    formValidator();
                  },
                  child: ValueListenableBuilder(
                      valueListenable: image,
                      builder: (context, imageFile, _) {
                        return DottedBorder(
                          color: Colors.grey.shade700,
                          dashPattern: const [8, 6],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (imageFile != null)
                                Image.file(
                                  File(imageFile.path),
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              else
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 28),
                                  decoration: BoxDecoration(
                                    color: theme.canvasColor,
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(Iconsax.gallery_add),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Choose file to upload',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.bodyLarge?.copyWith(
                                          height: 16 / 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      Text(
                                        'Formats: png, jpg, jpeg',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          height: 16 / 10,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 12),
                Text(
                  'Take a picture or video of the incident',
                  style: theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.primaryColor.withOpacity(0.4),
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: FilledButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }
}
