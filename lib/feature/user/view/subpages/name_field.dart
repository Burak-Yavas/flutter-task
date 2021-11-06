import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  NameField({Key? key}) : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  bool isValid = false;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Your Name?", style: TextStyle(fontSize: 30)),
                ),
                const Spacer(flex: 1),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTextFormField()),
                const Spacer(flex: 7),
                Center(child: buildNextTextButton(context)),
                const Spacer(flex: 1)
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
        controller: nameController,
        decoration: const InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelText: "Your Name",
            labelStyle: TextStyle(color: Colors.black)));
  }

  TextButton buildNextTextButton(BuildContext context) {
    return TextButton(
        child: const Text("Contunie", style: TextStyle(color: Colors.white)),
        onPressed: () {
          if (nameController.text.length > 5) {
            Navigator.pushNamed(context, 'userProfile');
          } else {
            null;
          }
        },
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.blue[900],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }
}
