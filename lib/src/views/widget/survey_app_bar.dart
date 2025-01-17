import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:survey_kit/src/configuration/app_bar_configuration.dart';
import 'package:survey_kit/src/controller/survey_controller.dart';
import 'package:survey_kit/src/widget/survey_progress.dart';
import 'package:provider/provider.dart';

class SurveyAppBar extends StatelessWidget {
  final AppBarConfiguration appBarConfiguration;
  final SurveyController? controller;

  const SurveyAppBar({
    required this.appBarConfiguration,
    this.controller,
  });

  @override
  PlatformAppBar build(BuildContext context) {
    final _showProgress =
        appBarConfiguration.showProgress ?? context.read<bool>();
    final _canGoBack = appBarConfiguration.canBack ?? true;

    final surveyController = controller ?? context.read<SurveyController>();
    return PlatformAppBar(
      leading: _canGoBack
          ? appBarConfiguration.leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
          : Container(),
      title: const Text("자가진단 TEST", textAlign : TextAlign.center ,style: TextStyle(fontSize: 25),),
      //title: _showProgress ? SurveyProgress() : SizedBox.shrink(),
      // trailingActions: [
      //   IconButton(
      //     icon: const Icon(Icons.home),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ],
    );
  }
}
