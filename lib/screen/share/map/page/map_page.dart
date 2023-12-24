//
// Created by BlackRose on 12/23/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/screen/share/map/widget/custom_marker_location.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends BasePage {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends BasePageState<MapPage> {
  @override
  void initBloc() {}

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
  Widget pageUI(BuildContext context) => FlutterMap(
        options: const MapOptions(
            initialCenter: LatLng(20.831011031766064, 105.33472285972364),
            initialZoom: 20,
            minZoom: 5,
            maxZoom: 25,
            interactionOptions: InteractionOptions(
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
            // Use the recommended flutter_map_cancellable_tile_provider package to
            // support the cancellation of loading tiles.
            tileProvider: CancellableNetworkTileProvider(),
            maxZoom: 22,
          ),
          MarkerLayer(
            markers: [
              Marker(
                  point: const LatLng(20.831011031766064, 105.33472285972364),
                  alignment: Alignment.bottomCenter,
                  width: 25,
                  height: 25,
                  child: CustomMarkerLocation(
                    title: "TRUNG TÂM DỊCH VỤ VIỆC LÀM TỈNH HÒA BÌNH",
                  ))
            ],
          ),
          RichAttributionWidget(
            popupInitialDisplayDuration: const Duration(seconds: 0),
            showFlutterMapAttribution: false,
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(
                  Uri.parse('https://openstreetmap.org/copyright'),
                ),
              ),
            ],
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Bản đồ";

  void openOSMCopyright() => launchUrl(
        Uri.parse('https://openstreetmap.org/copyright'),
      );
}
