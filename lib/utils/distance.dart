import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';

class Distanc{
  BuildContext context;
  Distanc(this.context);
  int calculateDistance( lat1,long1,lat2, lon2){

    final Distance distance = new Distance();

    // km = 423
    final double km = distance.as(LengthUnit.Kilometer,
        new LatLng(lat1,long1),new LatLng(lat2,lon2));
    return km.toInt();


  }
}