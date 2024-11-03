import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_sample_project/app.dart';
import 'package:login_sample_project/login_app_bloc_observer.dart';
import 'package:login_sample_project/remote_api/remote_api.dart';
import 'package:login_sample_project/repository.dart/login_repostiory.dart';

void main() {
  Bloc.observer = LoginAppBlocObserver();
  runApp(RepositoryProvider(
    create: (context) => LoginRepository(
      remoteApi: RemoteApi(),
    ),
    child: const LoginApp(),
  ));
}
