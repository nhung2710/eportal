//
// Created by BlackRose on 12/23/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'dart:convert';

import 'package:eportal/model/api/request/osm/osm_find_name_by_location_request.dart';
import 'package:eportal/repository/osm/osm_find_polyline_repository.dart';
import 'package:eportal/screen/share/map/widget/custom_marker_location.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/osm/osm_find_polyline_request.dart';
import '../../../../repository/osm/osm_find_location_by_name_repository.dart';
import '../../../../repository/osm/osm_find_name_by_location_repository.dart';

class MapPage extends BasePage {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends BasePageState<MapPage> {
  OsmFindPolylineRepository osmFindPolylineRepository = OsmFindPolylineRepository();
  OsmFindLocationByNameRepository osmFindLocationByNameRepository = OsmFindLocationByNameRepository();
  OsmFindNameByLocationRepository osmFindNameByLocationRepository = OsmFindNameByLocationRepository();
  MapController _mapController = MapController();
  List<Marker> markers = [];
  List<Polyline> polylines = [];
  LatLng initialCenter = LatLng(20.831011031766064, 105.33472285972364);

  @override
  void initBloc() {
    markers = [];
    markers.add(Marker(
            point: initialCenter,
            alignment: Alignment.bottomCenter,
            width: 25,
            height: 25,
            child: CustomMarkerLocation(
              title: "TRUNG TÂM DỊCH VỤ VIỆC LÀM TỈNH HÒA BÌNH",
            )));
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {

    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }
  @override
  double currentPadding(BuildContext context)  => 0;
  @override
  Widget pageUI(BuildContext context) => FlutterMap(
        mapController: _mapController,
        options:  MapOptions(
            initialCenter: initialCenter,
            initialZoom: 18,
            minZoom: 5,
            maxZoom: 25,
            keepAlive: true,
            onLongPress: onLongPress,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.doubleTapDragZoom |
                  InteractiveFlag.scrollWheelZoom |
                  InteractiveFlag.doubleTapDragZoom |
                  InteractiveFlag.doubleTapZoom |
                  InteractiveFlag.drag |
                  InteractiveFlag.flingAnimation |
                  InteractiveFlag.pinchMove |
                  InteractiveFlag.pinchZoom,
            )),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            subdomains: const ['a', 'b', 'c'],
            // Use the recommended flutter_map_cancellable_tile_provider package to
            // support the cancellation of loading tiles.
            tileProvider: CancellableNetworkTileProvider(),
            maxZoom: 22,
          ),
          MarkerLayer(
            markers: markers,
          ),
          PolylineLayer(
            polylines: polylines,

          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => openOSMCopyright(),
              child: const Icon(
                Icons.info_outline,
                    color: Colors.black38,
                size: 20,
              ),
            ),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Bản đồ";

  void openOSMCopyright(){
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxHeight: 400,
        minHeight: 50,
        maxWidth: double.maxFinite,
        minWidth: double.maxFinite,
      ),
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                  launchUrl(
                    Uri.parse('https://openstreetmap.org/copyright'),
                  );
                },
                text: "OpenStreetMap contributors",
              )
            ],
          ),
        );
      },
    );
  }

  void onLongPress(TapPosition tapPosition, LatLng point) {
    osmFindNameByLocationRepository.get(OsmFindNameByLocationRequest(latLng: point))
    .then((value){
      markers.add(Marker(
          point: point,
          alignment: Alignment.bottomCenter,
          width: 25,
          height: 25,
          child: CustomMarkerLocation(
            title: value.displayName.replaceWhenNullOrWhiteSpace(),
          )));
      return point;
    })
    .then((value){
      return osmFindPolylineRepository.get(OsmFindPolylineRequest(type: OsmFindPolylineType.routedCar, from: point, to: initialCenter))
          .then((value){
        List<LatLng> points = value.routes?.expand((element) => element.legs!.expand((element) => element.steps!.expand((element) => element.intersections!.map((element){
          return LatLng(element.location![1],element.location![0]);
        })))).toList()??[];
        polylines = [Polyline(points: points,color: Colors.blue,strokeWidth: 5,)];
        setState(() {

        });
      });
    })
    ;

  }
}
