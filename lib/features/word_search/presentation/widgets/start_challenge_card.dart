import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/navigation/router_path.dart';

class StartChallengeCard extends StatelessWidget {
  const StartChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(6.0)),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouterPathContainer.challengePage,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.testItemTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(AppLocalizations.of(context)!.testItemText)
                    ],
                  )),
                  const Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
