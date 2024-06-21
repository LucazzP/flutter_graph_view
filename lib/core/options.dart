// Copyright (c) 2023- All flutter_graph_view authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graph_view/flutter_graph_view.dart';

/// @en: The builder of the vertex panel, triggered when the mouse hovers.
///
/// @zh: 顶点数据面板的构建器，鼠标悬停到对应节点时触发。
typedef VertexPanelBuilder = Widget Function(
  Vertex hoverVertex,
  Viewfinder zoom,
);

/// @en: The builder of the edge data panel, triggered when the mouse hovers.
///
/// @zh: 边数据面板的构建器，鼠标悬停到对应节点时触发。
typedef EdgePanelBuilder = Widget Function(
  Edge hoverEdge,
  Viewfinder zoom,
);

/// @en: use for create background widget.
///
/// @zh: 用于创建背景
typedef BackgroundBuilder = Widget Function(BuildContext context);

/// @en: The getter of the vertex text style.
///
/// @zh: 顶点文字样式获取器
typedef VertexTextStyleGetter = TextStyle? Function(
  Vertex vertex,
  VertexShape? shape,
);

/// The core api for Graph Options.
///
/// 图配置项
class Options {
  /// The builder of the vertex panel, triggered when the mouse hovers.
  ///
  /// 顶点数据面板的构建器，鼠标悬停到对应节点时触发。
  VertexPanelBuilder? vertexPanelBuilder;

  /// The builder of the edge data panel, triggered when the mouse hovers.
  ///
  /// 边数据面板的构建器，鼠标悬停到对应节点时触发。
  EdgePanelBuilder? edgePanelBuilder;

  /// set shape strategy for components of vertex.
  ///
  /// 给点设置形状
  VertexShape vertexShape = VertexCircleShape();

  /// set shape strategy for components of edge.
  ///
  /// 给边设置形状
  EdgeShape edgeShape = EdgeLineShape();

  /// use for create background widget.
  ///
  /// 用于创建背景
  BackgroundBuilder backgroundBuilder = (context) => Container(
        color: Colors.black54,
      );

  GraphStyle graphStyle = GraphStyle();

  /// if render legend in canvas.
  ///
  /// 是否展示图例
  bool useLegend = true;

  /// if enable hit.
  ///
  /// 是否开启碰撞检测
  bool enableHit = true;

  /// @en: event callback when tap down on vertex.
  ///
  /// @zh: 点下顶点时的回调
  dynamic Function(Vertex vertex, TapDownEvent)? onVertexTapDown;

  /// @en: event callback when tap up on vertex.
  ///
  /// @zh: 抬起顶点时的回调
  dynamic Function(Vertex vertex, TapUpEvent)? onVertexTapUp;

  /// @en: event callback when tap cancel on vertex.
  ///
  /// @zh: 取消顶点时的回调
  dynamic Function(Vertex vertex, TapCancelEvent)? onVertexTapCancel;

  dynamic Function(Edge edge, TapUpEvent)? onEdgeTapUp;

  /// @en: the graph scale range. default to `Vector2(0.05, 5)`
  ///
  /// @zh: 图缩放范围
  Vector2 scaleRange = Vector2(0.05, 5.0);

  /// @en: if show text in vertex. default `vertex.id`, if you want to show other text, you can set `textGetter`.
  ///
  /// @zh: 是否展示顶点文字，默认展示顶点id，如果想展示其他文字，可以设置`textGetter`
  bool showText = true;

  /// @en: the text getter of vertex.
  ///
  /// @zh: 顶点文字获取器
  String Function(Vertex) textGetter = (Vertex vertex) => '${vertex.id}';

  /// @en: the delay of overlay disappear.
  ///
  /// @zh: overlay消失的延迟
  Duration? panelDelay;
}
