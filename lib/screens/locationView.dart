import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';

import 'package:localize_and_translate/localize_and_translate.dart';

class LocationView extends StatefulWidget {
  Function savedLocation;
  LatLng finallocation;
  String productLocation;

  Function backButton;
  LocationView({this.savedLocation, this.productLocation, this.backButton});
  @override
  State<LocationView> createState() => LocationViewState();
}

class LocationViewState extends State<LocationView> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();
  var currentLocation; //= LocationData;
  var location = new Location();

  String address;
  TextEditingController _address_controller = new TextEditingController();
  CameraPosition _CairoLocation = CameraPosition(
    target: LatLng(30.04119653718865, 31.257430873811245),
    zoom: 14.4746,
  );

  @override
  void initState() {
    if (widget.savedLocation != null) //add or update location of my product
        {
      if (widget.productLocation == null) //add location to new product
          {
        _userLocation().then((response) {
          widget.finallocation = response;
          print('response initstate :${widget.finallocation.latitude.toString()}');
          _CairoLocation = CameraPosition(
            target: response,
            zoom: 14.4746,
          );
          final Marker marker = Marker(
            markerId: MarkerId('Cairo'),
            position: response,
            icon: BitmapDescriptor.defaultMarker,
          );
          markers.add(marker);
        });
      } else //update the location of product
          {
        String lat = widget.productLocation.substring(0, widget.productLocation.indexOf(','));
        String lng = widget.productLocation.substring(widget.productLocation.indexOf(',') + 1);
        print('0x11 lat is :${lat} and long is : $lng');
        _CairoLocation = CameraPosition(
          target: LatLng(double.parse(lat), double.parse(lng)),
          zoom: 14.4746,
        );
        final Marker marker = Marker(
          markerId: MarkerId('Cairo'),
          position: LatLng(double.parse(lat), double.parse(lng)),
          icon: BitmapDescriptor.defaultMarker,
        );
        markers.add(marker);
      }
    } else // only show the product location from the home screen
        {
      String lat = widget.productLocation.substring(0, widget.productLocation.indexOf(','));
      String lng = widget.productLocation.substring(widget.productLocation.indexOf(',') + 1);
      print('0x11 lat is :${lat} and long is : $lng');
      _CairoLocation = CameraPosition(
        target: LatLng(double.parse(lat), double.parse(lng)),
        zoom: 14.4746,
      );
      final Marker marker = Marker(
        markerId: MarkerId('Cairo'),
        position: LatLng(double.parse(lat), double.parse(lng)),
        icon: BitmapDescriptor.defaultMarker,
      );
      markers.add(marker);
    }
    super.initState();
  }
  @override
  void dispose() {
    _address_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.savedLocation != null) {
      return

        new Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _CairoLocation,
                      onTap: (LatLng location) => setMarker(location),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: markers,
                    ),

                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s25),
                        child: Container(
                          width: SizeConfig.screenWidth * 0.9,
                          height: SizeConfig.screenHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "العنوان",
                                      style: TX_STYLE_black_14,
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: _userLocation,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.location_on,
                                        size: 25,
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: SizeConfig.screenWidth * 0.7,
                                      child: TextField(
                                        style: TX_STYLE_black_14,
                                        controller: _address_controller,
                                        decoration: InputDecoration(
                                          hintText: translator.translate('choose_branch'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _chooseLocation_button(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
//        persistentFooterButtons: <Widget>[
//          Row(
//            children: <Widget>[
//              FloatingActionButton.extended(
//                onPressed: ()=>confirm(),
//                label: Text('Okay!'),
//                icon: Icon(Icons.done_all),
//              ),
//              SizedBox(width: 100,),
//              FloatingActionButton.extended(
//                onPressed: _userLocation,
//                label: Text('To Your Location!'),
//                icon: Icon(Icons.gps_fixed),
//              ),
//            ],
//          ),
//
////          Container(
////            width: MediaQuery.of(context).size.width,
////            height: MediaQuery.of(context).size.height*0.08,
////            child: Stack(
////
////              children: <Widget>[
////                Positioned(
////                  left: 0.0,
////                  bottom: 0.0,
////                  child: FloatingActionButton.extended(
////                    onPressed: ()=>confirm(),
////                    label: Text('Okay!'),
////                    icon: Icon(Icons.done_all),
////                  ),
////                ),
////
////                   Positioned(
////                     right: 0.0,
////                     bottom: 0.0,
////                     child: FloatingActionButton.extended(
////                      onPressed: _userLocation,
////                      label: Text('To Your Location!'),
////                      icon: Icon(Icons.gps_fixed),
////                  ),
////                   ),
////
////              ],
////            ),
////          ),
//        ],
        );
      // );
    } else {
      return new Scaffold(
        //appBar: AppBar(title: Text('a7eeh',)),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _CairoLocation,
          //  onTap: (LatLng location)=>setMarker(location),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: markers,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _userLocation,
          label: Text('To Your Location!'),
          icon: Icon(Icons.gps_fixed),
        ),
//        persistentFooterButtons: <Widget>[
//          Row(
//            children: <Widget>[
//              FloatingActionButton.extended(
//                onPressed: ()=>confirm(),
//                label: Text('Okay!'),
//                icon: Icon(Icons.done_all),
//              ),
//              SizedBox(width: 100,),
//              FloatingActionButton.extended(
//                onPressed: _userLocation,
//                label: Text('To Your Location!'),
//                icon: Icon(Icons.gps_fixed),
//              ),
//            ],
//          ),
//
////          Container(
////            width: MediaQuery.of(context).size.width,
////            height: MediaQuery.of(context).size.height*0.08,
////            child: Stack(
////
////              children: <Widget>[
////                Positioned(
////                  left: 0.0,
////                  bottom: 0.0,
////                  child: FloatingActionButton.extended(
////                    onPressed: ()=>confirm(),
////                    label: Text('Okay!'),
////                    icon: Icon(Icons.done_all),
////                  ),
////                ),
////
////                   Positioned(
////                     right: 0.0,
////                     bottom: 0.0,
////                     child: FloatingActionButton.extended(
////                      onPressed: _userLocation,
////                      label: Text('To Your Location!'),
////                      icon: Icon(Icons.gps_fixed),
////                  ),
////                   ),
////
////              ],
////            ),
////          ),
//        ],
      );
    }
  }

  Future<LatLng> _userLocation() async {
    try {
      currentLocation = await location.getLocation();
      print('current location ${currentLocation.latitude} , the long is ${currentLocation.longitude}');
      LatLng current = LatLng(currentLocation.latitude, currentLocation.longitude);
      setMarker(current);
      return current;
    } catch (e) {
      if (e.toString().contains('PERMISSION_DENIED')) {
        print('Permission denied');
      }
      currentLocation = null;
      return null;
    }
  }

  void setMarker(LatLng location) async {
    widget.finallocation = location;
    print('setMarker setMarker :${widget.finallocation.latitude.toString()}');

    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(bearing: 360.0, target: location, tilt: 59.440717697143555, zoom: 14.4746)));
    markers.clear();
    _nameOfLOcation(location);
    final Marker marker = Marker(
      markerId: MarkerId('new one'),
      position: location,
      icon: BitmapDescriptor.defaultMarker,
    );
    print(location);
    setState(() {
      print(markers);
      markers.add(marker);
    });
  }

  confirm() {
    if(_address_controller.text!=null&&_address_controller.text.length>0)
    {  widget.savedLocation(widget.finallocation, _address_controller.text);}
    else
    {  widget.savedLocation(widget.finallocation, address);}
    Navigator.pop(context);
  }

  void _nameOfLOcation(LatLng location) async {
    final Geolocator _geolocator = Geolocator();
    List<Placemark> placemark = await _geolocator.placemarkFromCoordinates(location.latitude, location.longitude);

    var first = placemark.first;
    address = first.country + ' ' + first.administrativeArea + '  ' + first.name;
    print("0mmmx: name: ${first.name} country: ${first.country} all ${first} ::: ${first.administrativeArea}"
        "${first.subAdministrativeArea}  ::: ${first.subLocality}");
  }



  _chooseLocation_button() {
    return GestureDetector(
//      onTap: ()=>navigateAndKeepStack(context, PinCodeVerificationScreen("01069686072")),
      onTap: confirm,
      child: Card(
        elevation: 10,
        child: Container(
          height:SizeConfig.screenWidth * 0.1 ,
          width: SizeConfig.screenWidth * 0.9,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:8.0),
            child: Center(
              child: Text(
                translator.currentLanguage == "en" ? "Choose Location" : "أختر موقعك",
                style: TX_STYLE_white_14,
              ),
            ),
          ),
        ),
        color: Colors.blue,
      ),
    );
  }
}
