import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/deezer_service.dart';

final trackProvider = Provider((Ref ref){
  return DeezerService();
});