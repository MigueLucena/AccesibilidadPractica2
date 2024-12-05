import '/flutter_flow/flutter_flow_util.dart';
import 'datos_bancarios_widget.dart' show DatosBancariosWidget;
import 'package:flutter/material.dart';

class DatosBancariosModel extends FlutterFlowModel<DatosBancariosWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for introducir_numero widget.
  FocusNode? introducirNumeroFocusNode;
  TextEditingController? introducirNumeroTextController;
  String? Function(BuildContext, String?)?
      introducirNumeroTextControllerValidator;
  String? _introducirNumeroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ohj8f7em' /* Debe rellenar el número de tar... */,
      );
    }

    if (!RegExp('^\\d{16}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '41c6hcwk' /* Número de tarjeta no válido */,
      );
    }
    return null;
  }

  // State field(s) for expire widget.
  FocusNode? expireFocusNode;
  TextEditingController? expireTextController;
  String? Function(BuildContext, String?)? expireTextControllerValidator;
  String? _expireTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8iptlxwa' /* Debe rellenar la 
fecha de exp... */
        ,
      );
    }

    if (!RegExp('^(0[1-9]|1[0-2])\\/\\d{2}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'w3lmf74y' /* Formato de fecha 
debe ser MM... */
        ,
      );
    }
    return null;
  }

  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  String? _cvvTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o7a6f7cg' /* Debe rellenar el CVV */,
      );
    }

    if (!RegExp('^\\d{3,4}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3wvrafm3' /* Debe ser un número
 de 3 o 4 d... */
        ,
      );
    }
    return null;
  }

  // State field(s) for introducir_nombre widget.
  FocusNode? introducirNombreFocusNode;
  TextEditingController? introducirNombreTextController;
  String? Function(BuildContext, String?)?
      introducirNombreTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validationForm;

  @override
  void initState(BuildContext context) {
    introducirNumeroTextControllerValidator =
        _introducirNumeroTextControllerValidator;
    expireTextControllerValidator = _expireTextControllerValidator;
    cvvTextControllerValidator = _cvvTextControllerValidator;
  }

  @override
  void dispose() {
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
