import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_initial_page_widget.dart' show OnboardingInitialPageWidget;
import 'package:flutter/material.dart';

class OnboardingInitialPageModel
    extends FlutterFlowModel<OnboardingInitialPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
