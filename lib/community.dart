import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPostPage extends StatefulWidget {
  const VideoPostPage({super.key});

  @override
  State<VideoPostPage> createState() => _VideoPostPageState();
}

class _VideoPostPageState extends State<VideoPostPage> {
  bool isLiked = false;
  final ImagePicker _picker = ImagePicker();

  // pick image
  Future<void> pickImage() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print('Image path: ${image.path}');
    }
  }

  // pick video
  Future<void> pickVideo() async {
    final XFile? video =
        await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      print('Video path: ${video.path}');
    }
  }

  // bottom sheet
  void showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Pick Image'),
              onTap: () {
                Navigator.pop(context);
                pickImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Pick Video'),
              onTap: () {
                Navigator.pop(context);
                pickVideo();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Feed'),
        backgroundColor: const Color.fromARGB(101, 0, 0, 0),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://picsum.photos/400/300?random=$index',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  const Icon(Icons.comment),
                  const SizedBox(width: 10),
                  const Icon(Icons.share),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'This is a sample video caption',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),

      // ADD button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: showPickerOptions,
        child: const Icon(Icons.add),
      ),
    );
  }
}
