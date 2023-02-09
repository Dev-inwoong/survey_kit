import 'package:flutter/material.dart';
import 'package:survey_kit/src/result/step/instruction_step_result.dart';
import 'package:survey_kit/src/steps/predefined_steps/instruction_step.dart';
import 'package:survey_kit/src/views/widget/step_view.dart';
import 'package:bubble/bubble.dart';

class InstructionView extends StatelessWidget {
  final InstructionStep instructionStep;
  final DateTime _startDate = DateTime.now();

  InstructionView({required this.instructionStep});

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: instructionStep,
      title: Bubble(
        color: Colors.yellow[700],
        nip: BubbleNip.leftTop,
        child: Text(
          instructionStep.title,
          style: Theme.of(context).textTheme.bodyText2,

          textAlign: TextAlign.center,
        ),
      ),

      resultFunction: () => InstructionStepResult(
        instructionStep.stepIdentifier,
        _startDate,
        DateTime.now(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Bubble(
          color: Colors.white,
          nip: BubbleNip.rightTop,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                instructionStep.subtitle,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Container(
                child: Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
              ),
              Text(
                instructionStep.text,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
