import 'dart:ui';

import 'package:arcgis_maps_flutter/arcgis_maps_flutter.dart';

class MapEvent<T> {
  /// The ID of the Map this event is associated to.
  final int mapId;

  /// The value wrapped by this event
  final T value;

  /// Build a Map Event, that relates a mapId with a given value.
  ///
  /// The `mapId` is the id of the map that triggered the event.
  /// `value` may be `null` in events that don't transport any meaningful data.
  const MapEvent(this.mapId, this.value);
}

/// An event fired when a [Marker] is tapped.
class MarkerTapEvent extends MapEvent<MarkerId> {
  /// Build a MarkerTap Event triggered from the map represented by `mapId`.
  ///
  /// The `value` of this event is a [MarkerId] object that represents the tapped Marker.
  const MarkerTapEvent(
    super.mapId,
    super.markerId,
  );
}

/// An event fired when a [PolygonMarker] is tapped.
class PolygonTapEvent extends MapEvent<PolygonId> {
  /// Build a PolygonTap Event triggered from the map represented by `mapId`.
  ///
  /// The `value` of this event is a [PolygonId] object that represents the tapped Polygon.
  const PolygonTapEvent(
    super.mapId,
    super.polygonId,
  );
}

class PolylineTapEvent extends MapEvent<PolylineId> {
  /// Build a PolylineTap Event triggered from the map represented by `mapId`.
  ///
  /// The `value` of this event is a [PolylineId] object that represents the tapped Polygon.
  const PolylineTapEvent(
    super.mapId,
    super.polylineId,
  );
}

class UserLocationTapEvent extends MapEvent<void> {
  const UserLocationTapEvent(int mapId) : super(mapId, null);
}

class IdentifyLayerEvent extends MapEvent<LayerId> {
  const IdentifyLayerEvent(
    super.mapId,
    super.layerId, {
    required this.result,
    required this.screenPoint,
    required this.position,
  });

  final Offset screenPoint;
  final Point position;

  final IdentifyLayerResult result;
}

class IdentifyLayersEvent extends MapEvent<void> {
  const IdentifyLayersEvent(
    int mapId, {
    required this.results,
    required this.screenPoint,
    required this.position,
  }) : super(mapId, null);

  final Offset screenPoint;
  final Point? position;

  final List<IdentifyLayerResult> results;
}

class IdentifyGraphicsEvent extends _PositionedMapEvent<List<String>> {
  const IdentifyGraphicsEvent(
    super.mapId, {
    required super.screenPoint,
    required super.position,
    required super.value,
  });
}

class MapLoadedEvent extends MapEvent<ArcgisError?> {
  const MapLoadedEvent(
    super.mapId,
    super.value,
  );
}

class LayerLoadedEvent extends MapEvent<LayerId> {
  const LayerLoadedEvent(
    int mapId,
    this.error,
    LayerId value,
  ) : super(mapId, value);

  final ArcgisError? error;
}

/// An event fired when a Map is tapped.
class MapTapEvent extends _PositionedMapEvent<void> {
  /// Build an MapTap Event triggered from the map represented by `mapId`.
  ///
  /// The `position` of this event is the LatLng where the Map was tapped.
  const MapTapEvent(
    super.mapId, {
    required super.screenPoint,
    required super.position,
  }) : super(value: null);
}

class MapLongPressEvent extends _PositionedMapEvent<void> {
  const MapLongPressEvent(
    super.mapId, {
    required super.screenPoint,
    required super.position,
  }) : super(value: null);
}

class MapLongPressEndEvent extends _PositionedMapEvent<void> {
  const MapLongPressEndEvent(
    super.mapId, {
    required super.screenPoint,
    required super.position,
  }) : super(value: null);
}

class ViewpointChangedEvent extends MapEvent<void> {
  const ViewpointChangedEvent(int mapId) : super(mapId, null);
}

class TimeExtentChangedEvent extends MapEvent<TimeExtent?> {
  const TimeExtentChangedEvent(super.mapId, super.value);
}

/// A `MapEvent` associated to a `position`.
class _PositionedMapEvent<T> extends MapEvent<T> {
  /// Build a Positioned MapEvent, that relates a mapId and a position with a value.
  ///
  /// The `mapId` is the id of the map that triggered the event.
  /// `value` may be `null` in events that don't transport any meaningful data.
  const _PositionedMapEvent(
    int mapId, {
    required this.position,
    required this.screenPoint,
    required T value,
  }) : super(mapId, value);

  /// The position where this event happened.
  final Point? position;

  final Offset screenPoint;
}