import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';

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
              Material(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userEntity.email,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text("Test points: ${widget.userEntity.test}")
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(DI.profileManager).exit();
                },
                child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Exit",
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
