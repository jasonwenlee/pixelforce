import 'package:flutter/material.dart';
import 'package:pixelforce/components/image_loader.dart';
import 'package:pixelforce/network/explore_page_network_request.dart';

/// ThumbnailsLoader is a widget that takes a url, and loads a thumbnail.
class ThumbnailsLoader extends StatelessWidget {
  /// Takes in a url to an image.
  final String url;

  const ThumbnailsLoader({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: fetchData(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;
          if (data != null) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final name = data[index].name;
                final imageUrl = data[index].image;
                final rentedPropsCount = data[index].rentedPropsCount;
                return Container(
                  key: ValueKey('thumbnail_$name'),
                  padding: const EdgeInsets.all(5),
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ImageLoader(
                            key: ValueKey('image_$name'),
                            url: imageUrl,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              rentedPropsCount != null
                                  ? Text(
                                      '$rentedPropsCount rented props',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ); // Your custom widget for place cards
              },
            );
          }
          return const Text("Nothing to load.");
        },
      ),
    );
  }
}
