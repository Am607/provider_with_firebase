import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatefulWidget {
  const Gmap({Key? key}) : super(key: key);

  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  Set<Marker> _marker = {};
  late BitmapDescriptor mapMarker;

  // @override
  // void initState() {
  //   super.initState();
  //   print('Mubashir cp');
  //   setCustomMarker();
  // }

  // void setCustomMarker() async {
  //   mapMarker = await BitmapDescriptor.fromAssetImage(
  //           ImageConfiguration(size: Size(24, 24)), 'assets/hs1.png')
  //       .then((value) {
  //     return mapMarker = value;
  //   });
  // }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      mapMarker = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(55, 55)), 'assets/hs1.png');

      setState(() {});
    });
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _marker.add(
        Marker(
            markerId: MarkerId('1'),
            position: LatLng(10.8487, 75.9013),
            icon: mapMarker,
            onTap: () {
              print('its working');
            },
            infoWindow:
                InfoWindow(title: 'titile here', snippet: 'sub titile here')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _marker,
        initialCameraPosition:
            CameraPosition(target: LatLng(10.8487, 75.9013), zoom: 15),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
            child: Center(
                child: ImageIcon(
          AssetImage('assets/hs1.png'),
          color: Colors.white,
        ))),
      ),
    );
  }
}
