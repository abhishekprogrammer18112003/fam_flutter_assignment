import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fam_assignment/core/url_constants.dart';
import 'package:fam_assignment/features/home/models/hc1_model.dart';
import 'package:fam_assignment/features/home/models/hc3_model.dart';
import 'package:fam_assignment/features/home/models/hc5_model.dart';
import 'package:fam_assignment/features/home/models/hc6_model.dart';
import 'package:fam_assignment/features/home/models/hc9_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Hc1Model? _hc1;
  Hc1Model? get hc1 => _hc1;

  Hc3Model? _hc3;
  Hc3Model? get hc3 => _hc3;

  Hc5Model? _hc5;
  Hc5Model? get hc5 => _hc5;

  Hc6Model? _hc6;
  Hc6Model? get hc6 => _hc6;

  Hc9Model? _hc9;
  Hc9Model? get hc9 => _hc9;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getFullData() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(API_URL));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final groups = data[0]['hc_groups'] as List<dynamic>? ?? [];

        for (var group in groups) {
          switch (group['design_type']) {
            case 'HC1':
              _hc1 = Hc1Model.fromJson(group);
              break;
            case 'HC3':
              _hc3 = Hc3Model.fromJson(group);
              break;
            case 'HC5':
              _hc5 = Hc5Model.fromJson(group);
              break;
            case 'HC6':
              _hc6 = Hc6Model.fromJson(group);
              break;
            case 'HC9':
              _hc9 = Hc9Model.fromJson(group);
              break;
            default:
              print('Unknown designType: ${group['design_type']}');
          }
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    } finally {
      // print(hc1!.cards);

      print("Done");
      _isLoading = false;
      notifyListeners();
    }
  }
}
