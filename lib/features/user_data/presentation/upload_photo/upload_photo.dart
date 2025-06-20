import 'package:flutter/material.dart';
import 'package:foode/features/user_data/components/image_pick_component.dart';
import 'package:foode/features/user_data/presentation/payment_method/payment_method_page.dart';
import 'package:foode/features/user_data/user_data.dart';
import 'package:go_router/go_router.dart';

class UploadPhotoPage extends StatefulWidget {
  static const String url = "${PaymentMethodPage.url}/upload-photo";

  const UploadPhotoPage({super.key});

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  int _index = 0;

  /*
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;


  Future<void> _pickImage(ImageSource source) async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } else {
    }
  }*/

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
                        onPressed: () {
                          _index = 1;
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 10),
                      ImagePickComponent(
                        imgUrl: "assets/images/png/folder.png",
                        subtitle: "From gallery",
                        onPressed: () {
                          _index = 1;
                          setState(() {});
                        },
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
                          const CircleAvatar(
                              minRadius: 100,
                              backgroundColor: AppColors.pink,
                              backgroundImage: AssetImage(
                                "assets/images/png/pp_placeholder.jpg",
                              )),
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.pink,
                            ),
                            onPressed: () {},
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
              isActive: _index != 0,
              text: "Next",
              onPressed: () {
                context.go(SetLocationPage.url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
