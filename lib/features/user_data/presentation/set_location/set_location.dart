import 'package:flutter/material.dart';
import 'package:foode/features/user_data/components/image_pick_component.dart';
import 'package:foode/features/user_data/presentation/congrats/congrats_page.dart';
import 'package:foode/features/user_data/presentation/upload_photo/upload_photo.dart';
import 'package:foode/features/user_data/user_data.dart';
import 'package:go_router/go_router.dart';

class SetLocationPage extends StatefulWidget {
  static const String url = "${UploadPhotoPage.url}/set-location";

  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  int _index = 0;

  void onPressed() {
    setState(() {
      _index = _index == 1 ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Set your location",
        hasBottom: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            Center(
              child: ImagePickComponent(
                imgUrl: "assets/images/png/location.png",
                subtitle: "Take photo",
                onPressed: onPressed,
              ),
            ),
            const Spacer(),
            PrimaryButton(
              isActive: _index == 1,
              text: "Next",
              onPressed: () {
                context.go(CongratsPage.url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
