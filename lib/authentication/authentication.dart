import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:property_management/loading_screen/loading_screen.dart';
import 'package:property_management/mixins/input_validation_mixins.dart';

import '../base_response.dart';
import '../database/shared_preference.dart';
import '../onboarding/features/onboarding_states_notifiers.dart';

part 'entities/authentication_entity.dart';
part 'features/authentication_repository.dart';
part 'features/authentication_states.dart';
part 'features/authentication_states_notifier.dart';
part 'screens/forgot_password.dart';
part 'screens/login.dart';
part 'screens/sign_up.dart';
