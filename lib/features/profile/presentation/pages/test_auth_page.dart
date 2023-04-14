import 'package:flutter/material.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/data/repositories/user_repository_impl.dart';
import 'package:word_couch/features/profile/domain/use_cases/sign_in_use_case.dart';

class TestAuthPage extends StatefulWidget {
  const TestAuthPage({Key? key}) : super(key: key);

  @override
  State<TestAuthPage> createState() => _TestAuthPageState();
}

class _TestAuthPageState extends State<TestAuthPage> {
  late TextEditingController passwordController;
  late TextEditingController emailController;
  int state = 1;
  String textError = "";

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (state == 1) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("email"),
            TextField(
              controller: emailController,
            ),
            const SizedBox(height: 16),
            const Text("password"),
            TextField(
              controller: passwordController,
            ),
            TextButton(
                onPressed: () async {
                  setState(() {
                    state = 0;
                  });
                  SignInUseCase useCase = SignInUseCase(
                      userRepository: UserRepositoryImpl(
                          userAuthDataSource: UserAuthDataSource()));
                  final res = await useCase(
                    emailController.text,
                    passwordController.text,
                  );
                  res.fold((l) {
                    textError = l;
                    setState(() {
                      state = -1;
                    });
                  }, (r) {
                    setState(() {
                      state = 2;
                    });
                  });
                },
                child: const Text("Sign In"))
          ],
        ),
      );
    } else if (state == 0) {
      return const Scaffold(body: CircularProgressIndicator());
    } else if (state == 2) {
      return const Scaffold(
        body: Center(
          child: Text("AUTH"),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text(textError),
        ),
      );
    }
  }
}
