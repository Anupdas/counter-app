import 'package:counter_app/app.dart';
import 'package:counter_app/services/api/mock_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BlocApp(service: MockApiService()));
}
