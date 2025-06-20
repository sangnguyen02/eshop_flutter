import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CheckoutViewModel extends ChangeNotifier {
  final GoRouter router;
  final Ref _ref;

  CheckoutViewModel( this.router, this._ref);

}
