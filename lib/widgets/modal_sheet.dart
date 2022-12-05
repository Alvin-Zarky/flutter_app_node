import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 60,
          right: 25,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the text',
                        ),
                        validator: (values) =>
                            values!.isEmpty ? "Enter the text" : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        minLines: 6,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Enter the content',
                        ),
                        validator: (values) =>
                            values!.isEmpty ? "Enter the content" : null,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_globalKey.currentState!.validate()) {
                            debugPrint("success");
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 35),
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: Text(
                            "Submit".toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.7,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
