import 'package:dio/dio.dart';
import 'package:favelasemcorona/utils/api_helper.dart';

class ArcgisHelper{


  static getConfirmedCases(String neighborhood) async {
    var response = await ApiHelper.getRequest(null, "https://services1.arcgis.com/OlP4dGNtIcnD3RYf/arcgis/rest/services/Casos_individuais_3/FeatureServer/0/query?f=json&where=(bairro_resid__estadia='"+neighborhood+"')&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=[{\"statisticType\":\"count\",\"onStatisticField\":\"ObjectId2\",\"outStatisticFieldName\":\"value\"}]&resultType=standard&cacheHint=true");
    return response['features'][0]['attributes']['value'];
  }

  static getDeaths(String neighborhood) async {
    var response = await ApiHelper.getRequest(null, "https://services1.arcgis.com/OlP4dGNtIcnD3RYf/arcgis/rest/services/Casos_individuais_3/FeatureServer/0/query?f=json&where=(extra2_int='S') AND (bairro_resid__estadia='"+neighborhood+"')&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=[{\"statisticType\":\"count\",\"onStatisticField\":\"ObjectId2\",\"outStatisticFieldName\":\"value\"}]&resultType=standard&cacheHint=true");
    return response['features'][0]['attributes']['value'];
  }

  static getRecovered(String neighborhood) async {
    var response = await ApiHelper.getRequest(null, "https://services1.arcgis.com/OlP4dGNtIcnD3RYf/arcgis/rest/services/Casos_individuais_3/FeatureServer/0/query?f=json&where=(extra2_int='R') AND (bairro_resid__estadia='"+neighborhood+"')&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&outStatistics=[{\"statisticType\":\"count\",\"onStatisticField\":\"ObjectId2\",\"outStatisticFieldName\":\"value\"}]&resultType=standard&cacheHint=true");
    return response['features'][0]['attributes']['value'];
  }

}