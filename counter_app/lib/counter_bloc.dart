import 'dart:async';

import 'counter_event.dart';

class CounterBloc {
  int _counter = 0;
  final StreamController<int> _counterStateController = StreamController<int>();
  Stream<int> get counterStateStream => _counterStateController.stream;

  final StreamController<CounterEvent> _counterEventController =
      StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _counterStateController.sink.add(_counter);
  }
}
