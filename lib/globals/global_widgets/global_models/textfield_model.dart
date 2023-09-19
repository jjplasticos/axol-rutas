class TextfieldModel {
  final String text;
  final int position;

  const TextfieldModel({required this.text, required this.position});

  static TextfieldModel empty() =>
      const TextfieldModel(text: '', position: 0);
}