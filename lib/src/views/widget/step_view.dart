import 'package:flutter/material.dart';
import 'package:survey_kit/src/controller/survey_controller.dart';
import 'package:survey_kit/src/result/question_result.dart';
import 'package:survey_kit/src/steps/step.dart' as surveystep;
import 'package:provider/provider.dart';

class StepView extends StatelessWidget {
  final surveystep.Step step;
  final Widget title;
  final Widget child;
  final QuestionResult Function() resultFunction;
  final bool isValid;
  final SurveyController? controller;

  const StepView({
    required this.step,
    required this.child,
    required this.title,
    required this.resultFunction,
    this.controller,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    final _surveyController = controller ?? context.read<SurveyController>();
    return _content(_surveyController, context);
  }

  Widget _content(SurveyController surveyController, BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: title,
                ),
                child,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: step.stepIdentifier.id == "2" ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Test_BackButton.png"),
                          )
                        ),
                        child: TextButton(
                            onPressed: () => surveyController.stepBack(context: context),
                            child: Text("뒤로 가기", style: stepButtonStyle)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image:DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/Test_BackButton.png"),
                            )
                        ),
                        child: TextButton(
                            onPressed: isValid || step.isOptional
                                ? () => surveyController.closeSurvey(context: context, resultFunction: resultFunction) : null,
                            child: Text("결과 보기", style: stepButtonStyle)),
                      ),
                    ],
                  ):TextButton(
                    onPressed: isValid || step.isOptional
                        ? () =>
                        surveyController.nextStep(context, resultFunction)
                        : null,
                    child: Text(
                        step.buttonText?.toUpperCase() ??
                            context
                                .read<Map<String, String>?>()?['next']
                                ?.toUpperCase() ??
                            'Next',
                        style: stepButtonStyle
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
TextStyle stepButtonStyle =
TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w800
);
