// ignore_for_file: non_constant_identifier_names

class GeneralLibraryLocalAuthBase {
  GeneralLibraryLocalAuthBase();

  
  bool get is_support_local_auth {
    return false;
  }


  
  Future<bool> get is_device_support async {
    
    return false;
  }

  
  Future<List>  getAvailableBiometrics() async{
    
    return [];
  }
  
  Future<bool>  get can_check_biometrics async{
    
    return false;
  }

  
  Future<bool> authenticate({
    required String message,
  }) async {
    
    return false;
  }

  
  Future<bool> stopAuthentication() async {
    
    return false;
  }
}
