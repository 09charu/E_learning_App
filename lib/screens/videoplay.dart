import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


void main(){
  runApp(const VideoScreen());
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAC19A),
        title: const Text('Video player',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),),
      ),
      body: Container(
        color: Color(0xFFFFFBF3),
        child: const Center(
          child: Center(
            child: VideoPlayerWidget(videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          ),
        ),
      ),
    );
  }
}




class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key,required this.videoUrl}) : super(key: key);
  final String videoUrl;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState(){
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose(){
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot){
        if(snapshot.connectionState== ConnectionState.done){
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
