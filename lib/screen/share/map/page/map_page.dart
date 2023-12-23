//
// Created by BlackRose on 12/23/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

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
        options: MapOptions(
          initialCenter: const LatLng(20.757431649604978, 105.21017187830174),
          initialZoom: 12,
          maxZoom: 12,
          minZoom: 5,
          cameraConstraint: CameraConstraint.contain(
            bounds: LatLngBounds(
              const LatLng(20.74, 105.20),
              const LatLng(20.76, 105.22),
            ),
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // Use the recommended flutter_map_cancellable_tile_provider package to
            // support the cancellation of loading tiles.
            tileProvider: CancellableNetworkTileProvider(),
          )
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Bản đồ";
}
