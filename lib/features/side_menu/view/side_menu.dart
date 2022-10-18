import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/side_menu/view/widgets/add_task_button.dart';
import 'package:plano/features/side_menu/view/widgets/no_internet_widget.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../tasks_list/states/internet_connected_state.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final internetConnected = ref.watch(internetConnectedStateProvider);
    return Stack(
      children: [
        SizedBox(
          width: 266,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    17.0,
                    0.0,
                    15.0,
                  ),
                  child: Text(
                    'Project name',
                    style: context.textStyles.regular,
                  ),
                ),
                const AddTaskButton(),
              ],
            ),
          ),
        ),
        if (!internetConnected)
          const Positioned(
            bottom: 24,
            child: SizedBox(
              width: 266,
              child: NoInternetWidget(),
            ),
          ),
      ],
    );
  }
}
