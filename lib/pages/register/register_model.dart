import '/flutter_flow/flutter_flow_util.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for create-emailAddress widget.
  FocusNode? createEmailAddressFocusNode;
  TextEditingController? createEmailAddressTextController;
  String? Function(BuildContext, String?)?
      createEmailAddressTextControllerValidator;
  String? _createEmailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '79e1oh7l' /* Debe introducir un email */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6h4v3wg1' /* Por favor, introduce un correo... */,
      );
    }
    return null;
  }

  // State field(s) for create-password widget.
  FocusNode? createPasswordFocusNode;
  TextEditingController? createPasswordTextController;
  late bool createPasswordVisibility;
  String? Function(BuildContext, String?)?
      createPasswordTextControllerValidator;
  String? _createPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u1vyinwx' /* Debe introducir una contraseña */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'f6tgx5d2' /* La contraseña debe tener al me... */,
      );
    }

    if (!RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'd0sh95ek' /* La contraseña debe tener al me... */,
      );
    }
    return null;
  }

  // State field(s) for confirm-password widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vk2ix0y1' /* Debe confirmar la contraseña */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validationRegister;

  @override
  void initState(BuildContext context) {
    createEmailAddressTextControllerValidator =
        _createEmailAddressTextControllerValidator;
    createPasswordVisibility = false;
    createPasswordTextControllerValidator =
        _createPasswordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    createEmailAddressFocusNode?.dispose();
    createEmailAddressTextController?.dispose();

    createPasswordFocusNode?.dispose();
    createPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
