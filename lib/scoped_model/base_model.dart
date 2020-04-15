import 'package:scoped_model/scoped_model.dart';

import 'package:coronavirus/enum/view_state.dart';
export 'package:coronavirus/enum/view_state.dart';
// Make sure state enum is accessible in all inherting models

class BaseModel extends Model {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }
}
