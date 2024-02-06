import 'package:assignment_module_14/photos.dart';
import 'package:flutter/material.dart';

class PhotoDetails extends StatelessWidget {
  final Photo photo;
  const PhotoDetails({super.key,required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(photo.url!,fit: BoxFit.contain,),
              const SizedBox(height: 20,),
              Text(
                'Title: ${photo.title!}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                'ID: ${photo.id}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      foregroundColor: Colors.white,
      title: const Text('Photo Details'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
