import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'pago_widget.dart' show PagoWidget;
import 'package:flutter/material.dart';

class PagoModel extends FlutterFlowModel<PagoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for introducir_numero widget.
  FocusNode? introducirNumeroFocusNode;
  TextEditingController? introducirNumeroTextController;
  String? Function(BuildContext, String?)?
      introducirNumeroTextControllerValidator;
  // State field(s) for expire widget.
  FocusNode? expireFocusNode;
  TextEditingController? expireTextController;
  String? Function(BuildContext, String?)? expireTextControllerValidator;
  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  // State field(s) for introducir_nombre widget.
  FocusNode? introducirNombreFocusNode;
  TextEditingController? introducirNombreTextController;
  String? Function(BuildContext, String?)?
      introducirNombreTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
    introducirNumeroFocusNode?.dispose();
    introducirNumeroTextController?.dispose();

    expireFocusNode?.dispose();
    expireTextController?.dispose();

    cvvFocusNode?.dispose();
    cvvTextController?.dispose();

    introducirNombreFocusNode?.dispose();
    introducirNombreTextController?.dispose();
  }
}
