import 'dart:io';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorApp extends StatefulWidget {
  const TranslatorApp({super.key});

  @override
  State<TranslatorApp> createState() => _TranslatorAppState();
}

class _TranslatorAppState extends State<TranslatorApp> {
  List<String> languages = [
    'English',
    'Hindi',
    'Arabic',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese',
    'Italian'
  ];
  List<String> languagesCode = [
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it'
  ];

  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'hi';
  String translatedText = 'आप कैसे हैं?';
  String selectedFromLanguage = 'English';
  String selectedToLanguage = 'Hindi';
  TextEditingController textController =
  TextEditingController(text: 'How are you?');
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> translate() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final translation = await translator.translate(
        textController.text,
        from: from,
        to: to,
      );
      setState(() {
        translatedText = translation.text;
      });
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Internet not connected.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred: $e'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 25, 118, 210),
        title: const Text(
          'Translator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 118, 210),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // From Language Selector
            buildDropdownSelector(
              title: 'From',
              selectedLanguage: selectedFromLanguage,
              onChanged: (lang) {
                setState(() {
                  selectedFromLanguage = lang!;
                  from = languagesCode[languages.indexOf(lang)];
                });
              },
            ),

            // Text Input
            buildTextInput(),

            // To Language Selector
            buildDropdownSelector(
              title: 'To',
              selectedLanguage: selectedToLanguage,
              onChanged: (lang) {
                setState(() {
                  selectedToLanguage = lang!;
                  to = languagesCode[languages.indexOf(lang)];
                });
              },
            ),

            // Translated Text Display
            buildTranslatedText(),

            // Translate Button
            ElevatedButton(
              onPressed: translate,
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.indigo.shade900),
                fixedSize: MaterialStateProperty.all(const Size(300, 45)),
              ),
              child: isLoading
                  ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(color: Colors.white),
              )
                  : const Text('Translate'),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownSelector({
    required String title,
    required String selectedLanguage,
    required void Function(String?) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.indigo.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          DropdownButton<String>(
            value: selectedLanguage,
            items: languages.map((lang) {
              return DropdownMenuItem(
                value: lang,
                child: Text(lang),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget buildTextInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: textController,
          maxLines: null,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter text to translate',
          ),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget buildTranslatedText() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: SelectableText(
        translatedText,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
