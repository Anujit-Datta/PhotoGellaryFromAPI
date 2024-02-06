import 'dart:convert';

import 'package:assignment_module_14/PhotoDetailsScreen.dart';
import 'package:assignment_module_14/photos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Photo> photosList=[];
  bool inProgress=true,isError=false;
  @override
  void initState() {
    getPhotos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RefreshIndicator(
        color: Colors.blueAccent,
        onRefresh: getPhotos,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Visibility(
            visible: !inProgress,
            replacement: const Center(child: CircularProgressIndicator(color: Colors.blueAccent),),
            child: Visibility(
              visible: !isError,
              replacement: const Center(child: Text('Error fetching Data'),),
              child: buildListView(),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Photo Gallery App'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  ListView buildListView() {
    return ListView.builder(
            itemCount: photosList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoDetails(photo: photosList[index])));
                  },
                  leading: Image.network(photosList[index].thumbnailUrl!,),
                  title: Text(
                      photosList[index].title!,
                  ),
                ),
              );
            },
          );
  }

  Future<void> getPhotos()async{
    inProgress=true;
    setState(() {});
    Uri url=Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response=await get(url);
    List decodedJSON=jsonDecode(response.body);
    if(response.statusCode==200){
      photosList.clear();
      decodedJSON.forEach((element) {
        Photo photo=Photo.fromJson(element);
        photosList.add(photo);
      });
      isError=false;
    }else{
      isError=true;
    }
    inProgress=false;
    setState(() {});
  }
}
