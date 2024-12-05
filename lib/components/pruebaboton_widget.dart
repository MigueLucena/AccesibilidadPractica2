import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'pruebaboton_model.dart';
export 'pruebaboton_model.dart';

class PruebabotonWidget extends StatefulWidget {
  const PruebabotonWidget({super.key});

  @override
  State<PruebabotonWidget> createState() => _PruebabotonWidgetState();
}

class _PruebabotonWidgetState extends State<PruebabotonWidget> {
  late PruebabotonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PruebabotonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Semantics(
        label: 'Botón Ver Horarios Disponibles Fútbol Sala',
        child: FFButtonWidget(
          onPressed: () async {
            context.pushNamed('Disponibility');
          },
          text: FFLocalizations.of(context).getText(
            '9qiadij7' /* Ver Horarios Disponibles */,
          ),
          options: FFButtonOptions(
            height: 35.0,
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: const Color(0xFF24B24E),
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(8.0),
            hoverColor: FlutterFlowTheme.of(context).secondaryText,
            hoverTextColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
      ),
    );
  }
}
