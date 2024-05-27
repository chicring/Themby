// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
//
// import '../../../generated/l10n.dart';
// import '../view_model.dart';
//
// class AddServerDialog extends ConsumerStatefulWidget {
//   const AddServerDialog({super.key});
//
//   @override
//   ConsumerState<AddServerDialog> createState() => _AddServerDialogState();
// }
//
// class _AddServerDialogState extends ConsumerState<AddServerDialog> {
//   bool _passwordVisible = false;
//
//   OutlineInputBorder _inputBorder(BuildContext context) {
//     // 创建一个带有圆角的边框样式
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8), // 设置统一的圆角大小
//       borderSide: BorderSide(
//         color: Theme.of(context).dividerColor,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var homeState = ref.watch(homeVMProvider);
//     var homeVM = ref.watch(homeVMProvider.notifier);
//
//     return AlertDialog(
//       title: Text(S.of(context).addServer),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
//       content: ConstrainedBox(
//         constraints: const BoxConstraints(
//           minWidth: 800,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 10),
//               TextField(
//                 controller: homeState.hostController,
//                 decoration: InputDecoration(
//                   labelText: S.of(context).hostAddress,
//                   border: _inputBorder(context),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: homeState.portController,
//                 decoration: InputDecoration(
//                   labelText: S.of(context).port,
//                   border: _inputBorder(context),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: homeState.usernameController,
//                 decoration: InputDecoration(
//                   labelText: S.of(context).username,
//                   border: _inputBorder(context),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: homeState.passwordController,
//                 decoration: InputDecoration(
//                   labelText: S.of(context).password,
//                   border: _inputBorder(context),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       // 根据 _passwordVisible 状态切换图标
//                       _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       // 更新 _passwordVisible 状态
//                       setState(() {
//                         _passwordVisible = !_passwordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText: !_passwordVisible,
//               ),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             SmartDialog.dismiss();
//           },
//           child: Text(S.of(context).cancel),
//         ),
//         TextButton(
//           onPressed: () async {
//             await homeVM.addSite().then((value) {
//               SmartDialog.dismiss();
//             });
//           },
//           child: Text(S.of(context).link),
//         ),
//       ],
//     );
//   }
// }