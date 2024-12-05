import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for buscador widget.
  final buscadorKey = GlobalKey();
  FocusNode? buscadorFocusNode;
  TextEditingController? buscadorTextController;
  String? buscadorSelectedOption;
  String? Function(BuildContext, String?)? buscadorTextControllerValidator;
  List<CollectionRecord> simpleSearchResults1 = [];
  List<CollectionRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
  }

  @override
  void dispose() {
    buscadorFocusNode?.dispose();
  }
}
