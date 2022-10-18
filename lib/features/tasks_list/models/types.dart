import 'package:plano/features/tasks_list/models/global_types.dart';

import '../../../proto/generated/common.pbenum.dart';

//This is statuses model
class Types extends GlobalTypes {
  Types.backlog()
      : label = 'Бэклог',
        iconPath = 'assets/vector/backlog.svg';

  Types.cancelled()
      : label = 'Отменено',
        iconPath = 'assets/vector/cancelled.svg';

  Types.done()
      : label = 'Готово',
        iconPath = 'assets/vector/done.svg';

  Types.review()
      : label = 'На ревью',
        iconPath = 'assets/vector/review.svg';

  Types.inWork()
      : label = 'В работе',
        iconPath = 'assets/vector/in_work.svg';

  Types.waiting()
      : label = 'Ожидание',
        iconPath = 'assets/vector/waiting.svg';

  @override
  final String label;
  @override
  final String iconPath;

  factory Types.fromStatus(Status status) {
    switch (status.value) {
      case 0:
        return Types.backlog();
      case 2:
        return Types.inWork();
      case 3:
        return Types.done();
      case 4:
        return Types.cancelled();
      case 1:
        return Types.waiting();
      default:
        return Types.review();
    }
  }

  Status get status {
    switch (label) {
      case 'Бэклог':
        return Status.BACKLOG;
      case 'Отменено':
        return Status.CANCELED;
      case 'Готово':
        return Status.COMPLETED;
      case 'На ревью':
        return Status.REVIEW;
      case 'В работе':
        return Status.STARTED;
      default:
        return Status.UNSTARTED;
    }
  }

  @override
  int get padding {
    switch (label) {
      case 'Бэклог':
        return 1;
      case 'Отменено':
        return 6;
      case 'Готово':
        return 5;
      case 'На ревью':
        return 4;
      case 'В работе':
        return 3;
      default:
        return 2;
    }
  }

  @override
  int get hashCode {
    switch (label) {
      case 'Бэклог':
        return 4;
      case 'Отменено':
        return 6;
      case 'Готово':
        return 5;
      case 'На ревью':
        return 1;
      case 'В работе':
        return 2;
      default:
        return 3;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Types && other.hashCode == hashCode) return true;
    return false;
  }
}
