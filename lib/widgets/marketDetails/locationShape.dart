import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class LocationShape extends StatefulWidget {
  @override
  _LocationShapeState createState() => _LocationShapeState();
}

class _LocationShapeState extends State<LocationShape> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();

  @override
  void didChangeDependencies() {
  Marker marker = Marker(
    markerId: MarkerId('technical_location'),
    position:LatLng(Provider.of<MarketDetailsProvider>(context).marketDetails.latitude,Provider.of<MarketDetailsProvider>(context).marketDetails.longitude),
    icon:BitmapDescriptor.defaultMarker,
  );
  markers.add(marker);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s20),
            child: Text(translator.translate('our_location')),
          ),
          Container(
            height: SizeConfig.screenWidth*s200,


              child:  GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng( Provider.of<MarketDetailsProvider>(context).marketDetails.latitude??30,  Provider.of<MarketDetailsProvider>(context).marketDetails.longitude??31),
                  zoom: 8,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: markers,
              ),)
        ],
      ),
    );
  }
}
