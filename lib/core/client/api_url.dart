class ApiEndpoints {
  // Authentication Endpoints
  static const String login = '/v1/auth/login';
  static const String register = '/v1/auth/register';
  static const String logout = '/v1/auth/logout';
  static const String changePassword = '/v1/auth/change-password';
  static const String forgotPassword = '/v1/auth/forgot-password';
  static const String resetPassword = '/v1/auth/reset-password';
  static const String me = '/v1/auth/me';
  static const String requestResetOtp = '/v1/auth/forgot-password/otp';
  static const String requestRegisterOtp = '/v1/auth/register/otp';

  // Location Endpoints
  static const String getDistricts = '/v1/districts';
  static const String getDivisions = '/v1/divisions';
  static const String getUnions = '/v1/unions';
  static const String getUpazilas = '/v1/upazilas';

  // Poultry Firm Endpoints
  static const String poultryFirms = '/v1/poultry-firms';

  // Form Settings Endpoints
  static const String poultryBatchDoctorVisitSettings =
      '/v1/form-settings/poultry-batch-doctor-visit';
  static const String poultryBatchInfoSettings =
      '/v1/form-settings/poultry-batch-info';
  static const String poultryBatchSettings =
      '/v1/form-settings/poultry-batches';

  // Poultry Batch Doctor Visit Endpoints
  static const String poultryBatchDoctorVisit =
      '/v1/poultry-batch-doctor-visit';

  // Poultry Batch Info Endpoints
  static const String poultryBatchInfo = '/v1/poultry-batch-info';

  // Poultry Batches Endpoints
  static const String poultryBatches = '/v1/poultry-batches';

  // User Endpoints
  static const String getUser = '/v1/user';
}
