import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/logger.dart';

class ProfileUserWidget extends ConsumerStatefulWidget {
  final UserEntity userEntity;

  const ProfileUserWidget({
    Key? key,
    required this.userEntity,
  }) : super(key: key);

  @override
  ConsumerState<ProfileUserWidget> createState() => _ProfileUserWidgetState();
}

class _ProfileUserWidgetState extends ConsumerState<ProfileUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userEntity.email,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    // Text("Test points: ${widget.userEntity.test}")
                    Text(AppLocalizations.of(context)!.testPoint(widget.userEntity.test.toString()))
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // switch with text "safe search"
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Safe search"),
                    const Spacer(),
                    Switch(
                      value: ref.watch(DI.safeSearch),
                      onChanged: (value) {
                        logger.d("Safe search: $value");
                        ref.read(DI.profileManager).setSafeSearch(value);
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(DI.profileManager).exit();
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context)!.exit,
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
