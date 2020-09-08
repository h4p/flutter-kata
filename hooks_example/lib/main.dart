import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

main() => runApp(MyApp());

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return GestureDetector(
        onDoubleTap: () => counter.value++,
        onVerticalDragEnd: (details) => counter.value--,
        child: Center(
          child: Text(
            'Counter : ${counter.value}',
            textDirection: TextDirection.ltr,
          ),
        ));
  }
}
