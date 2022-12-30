import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ugrr/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class SilderWidget extends StatefulWidget {
  @override
  State<SilderWidget> createState() => _SilderWidgetState();
}

class _SilderWidgetState extends State<SilderWidget> {
  int currentPosition = 0;
  VideoPlayerController _controller;

  Future<List<PostData>> futurePost;
  @override
  void initState() {
    futurePost = fetchPost();
    _controller = VideoPlayerController.network(
        'https://ugrr.net/mobile/app/admin/UgrrAdmin1/ads/63a7f57ac893d9.79179496.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostData>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data.length,
              itemBuilder: ((context, index, realIndex) {
                return snapshot.data[index].ad_title.contains("Video add")
                    ? _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  VideoPlayer(_controller),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      icon: Icon(
                                        _controller.value.isPlaying
                                            ? Icons.pause_circle_filled_outlined
                                            : Icons.play_circle_fill_outlined,
                                        size: 45,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container()
                    : Container(
                        height: 200,
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data[index].media),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
              }),
              //Slider Container properties
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
                onPageChanged: ((index, reason) {
                  setState(() {
                    currentPosition = index;
                    // print("index: $currentPosition");
                  });
                }),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
        });
  }
  //

  Future<List<PostData>> fetchPost() async {
    final response = await http.get(
      Uri.parse("https://ugrr.net/mobile/api/getSlider.php"),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<PostData>((json) => PostData.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}



   // DotsIndicator(
                    //   dotsCount: 5,
                    //   position: currentPosition.toDouble(),
                    //   decorator: DotsDecorator(
                    //     size: const Size.square(6.0),
                    //     activeSize: const Size(15.0, 6.0),
                    //     activeColor: Colors.blue,
                    //     color: Colors.white,
                    //     activeShape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5.0),
                    //     ),
                    //   ),
                    // ),