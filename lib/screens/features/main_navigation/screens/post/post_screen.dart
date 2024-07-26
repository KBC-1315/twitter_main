import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/view_models/upload_post_view_model.dart';
import 'package:tictok_clone/utils.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  late List<File>? _selectedImages = [];
  File? photo;
  late List<PlatformFile>? hiddenImage = [];

  Future<void> takePhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.camera);

    if (photo == null || !mounted) return;

    setState(() {
      _selectedImages = [File(photo.path)];
    });
    await GallerySaver.saveImage(photo.path);
  }

  Future<void> selectPhoto() async {
    final photo = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: false,
      withReadStream: true,
      allowedExtensions: ["jpg", "png", "gif"],
      allowMultiple: true, // 여러 파일 선택
    );

    if (photo == null || !mounted) {
      safePrint("No file selected");
      return;
    }
    final platformFiles = photo.files;
    hiddenImage = platformFiles;
    setState(() {
      _selectedImages = platformFiles.map((file) => File(file.path!)).toList();
    });
  }

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _textFieldKey = GlobalKey();

  double textFieldHeight = 60;

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _postThread() async {
    if (_selectedImages != null) {
      await ref
          .read(uploadPostProvider.notifier)
          .uploadPost(hiddenImage, context, _textController.text);
    }
    _focusNode.unfocus();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("포스팅 완료!"),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: !isDarkMode(context, ref) ? Colors.white : Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.size14),
          topRight: Radius.circular(Sizes.size14),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 80,
          leading: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: !isDarkMode(context, ref) ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            "New thread",
            style: TextStyle(
                color: !isDarkMode(context, ref) ? Colors.black : Colors.white),
          ),
          backgroundColor:
              !isDarkMode(context, ref) ? Colors.white : Colors.black,
          elevation: 0,
        ),
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => _focusNode.unfocus(), // 화면을 터치하면 키보드를 숨깁니다.
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 20, child: Text("ME"), // 사용자 이미지 URL 추가
                        ),
                        SizedBox(width: 10),
                        Text(
                          "jane_mobbin",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              TextField(
                                key: _textFieldKey,
                                controller: _textController,
                                focusNode: _focusNode,
                                decoration: const InputDecoration(
                                  hintText: "Start a thread...",
                                  border: InputBorder.none,
                                ),
                                maxLines: null, // 여러 줄 입력을 허용
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: selectPhoto,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: !isDarkMode(context, ref)
                                              ? Colors.black
                                              : Colors.white,
                                          shape: BoxShape.circle),
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(
                                        color: !isDarkMode(context, ref)
                                            ? Colors.white
                                            : Colors.black,
                                        Icons.crop_original_sharp,
                                      ),
                                    ),
                                  ),
                                  Gaps.h20,
                                  GestureDetector(
                                    onTap: takePhoto,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: !isDarkMode(context, ref)
                                              ? Colors.black
                                              : Colors.white),
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(
                                        color: !isDarkMode(context, ref)
                                            ? Colors.white
                                            : Colors.black,
                                        Icons.camera_alt_outlined,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.v28,
                              Row(
                                children: [
                                  if (_selectedImages!.isNotEmpty)
                                    Expanded(
                                      child: SizedBox(
                                          height: 300,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  _selectedImages!.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Image.file(
                                                    _selectedImages![index],
                                                    height: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              })),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              width: size.width,
              bottom: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  children: [
                    Divider(
                      height: 1,
                      color: !isDarkMode(context, ref)
                          ? Colors.grey.shade300
                          : Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Anyone can reply",
                          style: TextStyle(
                              color: !isDarkMode(context, ref)
                                  ? Colors.grey
                                  : Colors.white),
                        ),
                        ref.watch(uploadPostProvider).isLoading
                            ? const CircularProgressIndicator()
                            : TextButton(
                                onPressed: _postThread,
                                child: const Text(
                                  "Post",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
