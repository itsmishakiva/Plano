import 'package:plano/proto/generated/common.pb.dart' as gen;

import 'global_types.dart';

//This is priority model
class PriorityTypes extends GlobalTypes {
  PriorityTypes.none()
      : label = 'Без проритета',
        iconPath = 'assets/vector/priority_none.svg';

  PriorityTypes.urgently()
      : label = 'Срочно',
        iconPath = 'assets/vector/priority_urgency.svg';

  PriorityTypes.high()
      : label = 'Высокий',
        iconPath = 'assets/vector/priority_high.svg';

  PriorityTypes.mid()
      : label = 'Средний',
        iconPath = 'assets/vector/priority_mid.svg';

  PriorityTypes.low()
      : label = 'Низкий',
        iconPath = 'assets/vector/priority_low.svg';

  factory PriorityTypes.fromPriority(gen.Priority status) {
    switch (status.value) {
      case 0:
        return PriorityTypes.low();
      case 1:
        return PriorityTypes.mid();
      case 2:
        return PriorityTypes.high();
      case 3:
        return PriorityTypes.urgently();
      default:
        return PriorityTypes.none();
    }
  }

  gen.Priority get priority {
    switch (label) {
      case 'Без проритета':
        return gen.Priority.NONE;
      case 'Срочно':
        return gen.Priority.URGENT;
      case 'Средний':
        return gen.Priority.MEDIUM;
      case 'Высокий':
        return gen.Priority.HIGH;
      default:
        return gen.Priority.LOW;
    }
  }

  get isImportant => label == 'Срочно';

  @override
  final String label;
  @override
  final String iconPath;

  @override
  int get padding {
    return hashCode;
  }

  @override
  int get hashCode {
    switch (label) {
      case 'Без проритета':
        return 1;
      case 'Срочно':
        return 2;
      case 'Средний':
        return 4;
      case 'Высокий':
        return 3;
      default:
        return 5;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is PriorityTypes && other.hashCode == hashCode) return true;
    return false;
  }
}
