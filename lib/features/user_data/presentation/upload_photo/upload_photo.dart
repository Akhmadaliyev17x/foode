import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foode/features/user_data/components/image_pick_component.dart';
import 'package:foode/features/user_data/presentation/payment_method/payment_method_page.dart';
import 'package:foode/features/user_data/user_data.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoPage extends StatefulWidget {
  static const String url = "${PaymentMethodPage.url}/upload-photo";

  const UploadPhotoPage({super.key});

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  int _index = 1;
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 75);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
        _index = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Upload Photo",
        hasBottom: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                alignment: Alignment.center,
                index: _index,
                children: [
                  ListView(
                    children: [
                      ImagePickComponent(
                        imgUrl: "assets/images/png/camera.png",
                        subtitle: "Take photo",
                        onPressed: () => _pickImage(ImageSource.camera),
                      ),
                      const SizedBox(height: 10),
                      ImagePickComponent(
                        imgUrl: "assets/images/png/folder.png",
                        subtitle: "From gallery",
                        onPressed: () => _pickImage(ImageSource.gallery),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const Alignment(0, -0.7),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            minRadius: 100,
                            backgroundColor: AppColors.pink,
                            backgroundImage: _pickedImage != null
                                ? FileImage(_pickedImage!)
                                : const AssetImage(
                                    "assets/images/png/pp_placeholder.jpg",
                                  ) as ImageProvider,
                          ),
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.pink,
                            ),
                            onPressed: () {
                              _pickImage(ImageSource.gallery);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              isActive: _pickedImage != null,
              text: "Next",
              onPressed: () {
                if (_pickedImage != null) {
                  context.go(SetLocationPage.url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
