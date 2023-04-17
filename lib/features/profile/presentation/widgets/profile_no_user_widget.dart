import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/navigation/router_path.dart';

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
                "Log in to your profile to save your favorite words, query history, and test points",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(DI.authManager).loading();
                  Navigator.pushNamed(context, RouterPathContainer.authPage);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Log in",
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
