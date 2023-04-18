import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/navigation/router_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileNoUserWidget extends ConsumerStatefulWidget {
  const ProfileNoUserWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileNoUserWidget> createState() =>
      _ProfileNoUserWidgetState();
}

class _ProfileNoUserWidgetState extends ConsumerState<ProfileNoUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.noUserText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(DI.authManager).loaded();
                  Navigator.pushNamed(context, RouterPathContainer.authPage);
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    AppLocalizations.of(context)!.logIn,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
