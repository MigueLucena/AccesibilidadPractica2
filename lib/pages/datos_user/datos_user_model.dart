import '/flutter_flow/flutter_flow_util.dart';
import 'datos_user_widget.dart' show DatosUserWidget;
import 'package:flutter/material.dart';

class DatosUserModel extends FlutterFlowModel<DatosUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nombreNuevo widget.
  FocusNode? nombreNuevoFocusNode;
  TextEditingController? nombreNuevoTextController;
  String? Function(BuildContext, String?)? nombreNuevoTextControllerValidator;
  // State field(s) for phoneNuevo widget.
  FocusNode? phoneNuevoFocusNode;
  TextEditingController? phoneNuevoTextController;
  String? Function(BuildContext, String?)? phoneNuevoTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreNuevoFocusNode?.dispose();
    nombreNuevoTextController?.dispose();

    phoneNuevoFocusNode?.dispose();
    phoneNuevoTextController?.dispose();
  }
}
