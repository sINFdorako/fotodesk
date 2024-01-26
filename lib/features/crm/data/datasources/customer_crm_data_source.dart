import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import 'package:fotodesk/features/crm/data/models/customer_crm_model.dart';

class CustomerCRMDataSource {
  final Dio _dio = DioClient().fotoDeskApi;

  Future<void> createCustomerCRM(CustomerCRMModel customerCRMModel) async {
    try {
      final response = await _dio.post('/customer-crm');

      if (response.statusCode == 200) {
        // return response
      } else {
        throw Exception(
            'Something went wrong when creating a customer for crm');
      }
    } catch (error) {}
  }
}
