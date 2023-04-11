import 'package:flutter/material.dart';
import 'package:color_picker_camera/color_picker_camera.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Disables the debug banner
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color bgColor = Colors.black;
  String selectedColor;

  // String colorName = "";//

  @override
  void initState() {
    super.initState();
    selectedColor = ""; // Initializing the selectedColor variable
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "ColorCiel",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.grey[800],
        elevation: 30,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // colorName ?? "",
            ":)",
            // "\"Color is the language of the soul, painting our world with endless possibilities.\"",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          SelectableText(
            selectedColor ?? "",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              String colorCode = await ColorPickerCamera.captureColorFromCamera;
              setState(() {
                selectedColor = colorCode;
                bgColor = Color(int.parse(colorCode));
                // colorName = bgColor.toString();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800], // Change the button color
              elevation: 3, // Remove the shadow
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20),
              // ),
            ),
            child: const Text("Pick a color"),
          )
        ],
      ),
    );
  }
}
