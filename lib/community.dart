import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPostPage extends StatefulWidget {
  const VideoPostPage({super.key});

  @override
  State<VideoPostPage> createState() => _VideoPostPageState();
}

class _VideoPostPageState extends State<VideoPostPage> {
  final ImagePicker _picker = ImagePicker();

  // like state per post
  List<bool> likes = List.generate(5, (index) => false);

  // pick image
  Future<void> pickImage() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint('Image path: ${image.path}');
    }
  }

  // pick video
  Future<void> pickVideo() async {
    final XFile? video =
        await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      debugPrint('Video path: ${video.path}');
    }
  }

  // bottom sheet
  void showPickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image,
                    color: Color.fromARGB(250, 218, 98, 17)),
                title: const Text('Post Image'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library,
                    color: Color.fromARGB(250, 218, 98, 17)),
                title: const Text('Post Video'),
                onTap: () {
                  Navigator.pop(context);
                  pickVideo();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔹 APP BAR (BACK BUTTON + HOME STYLE)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,

        // ✅ BACK BUTTON
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(250, 218, 98, 17),
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.pets,
              color: Color.fromARGB(250, 218, 98, 17),
              size: 26,
            ),
            SizedBox(width: 8),
            Text(
              "Community",
              style: TextStyle(
                color: Color.fromARGB(250, 218, 98, 17),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
          ],
        ),
      ),

      // 🔹 FEED
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        itemCount: likes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 👤 USER HEADER
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/150?img=3'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Pet Lover',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),

                // 🖼 POST IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://picsum.photos/400/300?random=$index',
                    width: double.infinity,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),

                // ❤️ ACTIONS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          likes[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: likes[index]
                              ? Colors.red
                              : Colors.grey.shade800,
                        ),
                        onPressed: () {
                          setState(() {
                            likes[index] = !likes[index];
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.comment_outlined,
                            color: Colors.grey.shade800),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined,
                            color: Colors.grey.shade800),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // 📝 CAPTION
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  child: Text(
                    'Bruno enjoying his evening walk 🐶',
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),

      // ➕ ADD POST BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(250, 218, 98, 17),
        elevation: 6,
        onPressed: showPickerOptions,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
