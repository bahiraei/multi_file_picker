import 'package:flutter/material.dart';
import 'package:multi_file_picker/multi_image_picker/multi_image_picker_view.dart';

import 'image_picker_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MultiImagePickerController imagePickerController = MultiImagePickerController(
    maxImages: 5,
    withData: true,
    withReadStream: true,
    allowedImageTypes: ['png', 'jpg', 'jpeg', 'pdf'],
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home Page',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MultiImagePickerView(
              controller: imagePickerController,
              draggable: true,
              addMoreBuilder: (context, pickerCallback) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        bool? isCheckedCamera = await showDialog(
                          context: context,
                          builder: (context) {
                            return const ImagePickerTypeDialog();
                          },
                        );

                        if (isCheckedCamera == null) {
                          return;
                        }
                        pickerCallback.call(isCheckedCamera);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 36,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
              initialContainerBuilder: (context, pickerCallback) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () async {
                            bool? isCheckedCamera = await showDialog(
                              context: context,
                              builder: (context) {
                                return const ImagePickerTypeDialog();
                              },
                            );

                            if (isCheckedCamera == null) {
                              return;
                            }
                            pickerCallback.call(isCheckedCamera);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.file_present_rounded,
                                        size: 42,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'انتخاب فایل',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
