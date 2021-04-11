
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ween_arooh/model/offersModel.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
int _currentIndex=0;
int _index=0;
int _couponsindex=0;
List<Result> _market=[];
int listLength=0;
String imagePath= "";
Result item;
VideoPlayerController _controller;
Future<void> _initializeVideoPlayerFuture;
bool video = false;
@override
  void didChangeDependencies() {
  final ScreenArguments args = ModalRoute.of(context).settings.arguments as ScreenArguments;
  item=args.item;
  _market=args.ListData;
  _currentIndex =args.StartIndex;
  listLength= args.ListCount;
  var path=_market[_currentIndex].offers[_index].path;
  if (path.contains('.jpg') ||
      path.contains('.png') ||
      path.contains('.jpeg'))
  {
    video=false;
    imagePath= _market[_currentIndex].offers[_index].path;

  }
  else
    {
      _controller = VideoPlayerController.network(
        _market[_currentIndex].offers[_index].path,
      );
      // Initialize the controller and store the Future for later use.
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      video=true;
    }




    super.didChangeDependencies();
  }

@override
void dispose() {
  // Ensure disposing of the VideoPlayerController to free up resources.
  _controller.dispose();

  super.dispose();
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: InkWell(
            onTap: (){
              setState(() {
                if(_market[_currentIndex].offers!= null  && _index < _market[_currentIndex].offers.length-1){
                  print('add image Offers');
                  _index++;
                  var path = _market[_currentIndex].offers[_index].path.toLowerCase();
                  if (path.contains('.jpg') ||
                      path.contains('.png') ||
                      path.contains('.jpeg'))
                    {
                      video=false;
                      imagePath = _market[_currentIndex].offers[_index].path;
                    }
                  else
                    {
                      _controller = VideoPlayerController.network(
                        _market[_currentIndex].offers[_index].path,
                      );
                      // Initialize the controller and store the Future for later use.
                      _initializeVideoPlayerFuture = _controller.initialize();
                      _controller.setLooping(true);
                      video=true;
                    }
                }
                else if(_market[_currentIndex].coupons != null  && _couponsindex < _market[_currentIndex].coupons.length){
                  print('add image coupons');
                  video=false;
                  imagePath= _market[_currentIndex].coupons[_couponsindex].path;
                  _couponsindex++;
                }
                else {
                  Navigator.pop(context);
                };
              });


            },
            child: (!video)? FadeInImage.assetNetwork(
              placeholder:"",
              fit: BoxFit.fill,
              image: imagePath??"",


              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,):
            Center(child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                }
                else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ))),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: (video)?Colors.blue:Colors.transparent,
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: (video)? Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ):Container(),
      ),
    );
  }
}
