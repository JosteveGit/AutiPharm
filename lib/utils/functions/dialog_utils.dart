import 'package:auti_pharm/utils/widgets/enter_arena_pin_dialog.dart';
import 'package:flutter/material.dart';
import 'package:simpleprogressdialog/builders/material_dialog_builder.dart';
import 'package:simpleprogressdialog/simpleprogressdialog.dart';

ProgressDialog _progressDialog = ProgressDialog(barrierDismissible: false);

void showLoader(BuildContext context) {
  _progressDialog.context = context;
  _progressDialog.showMaterial(
    layout: MaterialProgressDialogLayout.overlayCircularProgressIndicator,
  );
}

void popLoader() {
  _progressDialog.dismiss();
}

Future<void> showEnterAreanPinDialog(BuildContext context, {String operation, Function(String pin) onPinEntered}) async {
  String pin = await showDialog(
    context: context,
    builder: (_) => EnterArenaPinDialog(operation: operation,),
  );
  if(pin != null){
    onPinEntered(pin);
  }
}
