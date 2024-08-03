import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding_initial_page_model.dart';
export 'onboarding_initial_page_model.dart';

class OnboardingInitialPageWidget extends StatefulWidget {
  /// First page when an user does not have an account, here we create an
  /// aacount as anonymous user
  const OnboardingInitialPageWidget({super.key});

  @override
  State<OnboardingInitialPageWidget> createState() =>
      _OnboardingInitialPageWidgetState();
}

class _OnboardingInitialPageWidgetState
    extends State<OnboardingInitialPageWidget> {
  late OnboardingInitialPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingInitialPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
