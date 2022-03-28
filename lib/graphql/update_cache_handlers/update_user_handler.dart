import 'package:ferry/typed_links.dart';

import '../mutations/update_user.data.gql.dart';
import '../mutations/update_user.var.gql.dart';
import '../queries/viewer.data.gql.dart';
import '../queries/viewer.req.gql.dart';

const String updateUserHandlerKey = 'updateUserHandler';

void updateUserHandler(
  CacheProxy proxy,
  OperationResponse<GUpdateUserData, GUpdateUserVars> response,
) {
  if (response.hasErrors) {
    return;
  }

  _updateViewerRequest(proxy, response.data!.updateUser);
}

void _updateViewerRequest(
  CacheProxy proxy,
  GUpdateUserData_updateUser updateUser,
) {
  proxy.writeQuery(
    GViewerReq(),
    GViewerData((b) {
      b.viewer = GViewerData_viewer.fromJson(updateUser.toJson())!.toBuilder();
    }),
  );
}
