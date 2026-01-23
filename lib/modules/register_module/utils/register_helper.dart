import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/register_module/class/register_data.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterHelper {
  final BuildContext context;
  const RegisterHelper({required this.context});

  void userRegister({RegisterData? data}) {
    FocusScope.of(context).unfocus();
    if (data == null) {
      CustomSnackbar.showError(context, message: 'Please fill all the fields');
      return;
    }

    final UserRegisterBloc userRegisterBloc = context.read<UserRegisterBloc>();
    userRegisterBloc.add(UserRegisterEvent.userRegister(data: data));
  }
}
