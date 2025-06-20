import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode/app.dart';
import 'package:foode/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:foode/features/auth/data/repo_impl/auth_repository_implementation.dart';
import 'package:foode/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:foode/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final authDataSource = AuthRemoteDataSource(
    auth: firebaseAuth,
    firestore: fireStore,
  );
  final authRepositoryImpl = AuthRepositoryImpl(
    authRemoteDataSource: authDataSource,
  );

  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: authRepositoryImpl),
      child: const Foode(),
    ),
  );
}
