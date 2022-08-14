import 'package:flutter/material.dart';
import 'package:simple_chat_app/repo/image_repository.dart';
import '../models/image_model.dart';

class NetworkImagePicker extends StatelessWidget {
  final Function(String) onImageSelected;
  final ImageRepository imageRepository = ImageRepository();

  NetworkImagePicker({Key? key, required this.onImageSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
      child: FutureBuilder<List<PixelFordImage>>(
          future: imageRepository.getNetworkImages(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PixelFordImage>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    mainAxisSpacing: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      onImageSelected(snapshot.data![index].urlFullSize.toString());
                    },
                      child: Image.network(snapshot.data![index].urlSmallSize));
                },
              );
            }
            else if (snapshot.hasError) {return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("This is the Error : ${snapshot.error}"),
            );}
            else {
              return Padding(
                padding: const EdgeInsets.all(100.0),
                child: LinearProgressIndicator(),
              );
            }
          }),
    );
  }
}
