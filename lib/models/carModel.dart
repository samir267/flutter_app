class CarModel {
  final int id;
  final String vin;
  final String displayColor;
  final int year;
  final String make;
  final String model;
  final String price;
  final String mileage;
  final String city;
  final double lat;
  final double lon;
  final String primaryPhotoUrl;
  final String condition;
  final int providerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int modelId;
  final String dealerName;
  final bool active;
  final String state;
  final String trim;
  final String clickoffUrl;
  final bool acceptsLeads;
  final String bodyType;
  final String bodyStyle;
  final TrackingParams trackingParams;
  final int providerGroupId;
  final int mileageUnformatted;
  final String mileageHumanized;
  final String priceMobile;
  final int priceUnformatted;
  final bool recentPriceDrop;
  final String vdpUrl;
  final bool showNewMileage;
  final bool eligibleForFinancing;
  final String financingExperience;
  final List<String> photoUrls;
  final bool isHot;
  final String hrefTarget;
  final int distanceFromOrigin;
  final String providerName;
  final bool availableNationwide;
  final bool regional;
  final String thumbnailUrl;
  final String thumbnailUrlLarge;

  CarModel({
    required this.id,
    required this.vin,
    required this.displayColor,
    required this.year,
    required this.make,
    required this.model,
    required this.price,
    required this.mileage,
    required this.city,
    required this.lat,
    required this.lon,
    required this.primaryPhotoUrl,
    required this.condition,
    required this.providerId,
    required this.createdAt,
    required this.updatedAt,
    required this.modelId,
    required this.dealerName,
    required this.active,
    required this.state,
    required this.trim,
    required this.clickoffUrl,
    required this.acceptsLeads,
    required this.bodyType,
    required this.bodyStyle,
    required this.trackingParams,
    required this.providerGroupId,
    required this.mileageUnformatted,
    required this.mileageHumanized,
    required this.priceMobile,
    required this.priceUnformatted,
    required this.recentPriceDrop,
    required this.vdpUrl,
    required this.showNewMileage,
    required this.eligibleForFinancing,
    required this.financingExperience,
    required this.photoUrls,
    required this.isHot,
    required this.hrefTarget,
    required this.distanceFromOrigin,
    required this.providerName,
    required this.availableNationwide,
    required this.regional,
    required this.thumbnailUrl,
    required this.thumbnailUrlLarge,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      vin: json['vin'],
      displayColor: json['displayColor'],
      year: json['year'],
      make: json['make'],
      model: json['model'],
      price: json['price'],
      mileage: json['mileage'],
      city: json['city'],
      lat: json['lat'],
      lon: json['lon'],
      primaryPhotoUrl: json['primaryPhotoUrl'],
      condition: json['condition'],
      providerId: json['providerId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      modelId: json['modelId'],
      dealerName: json['dealerName'],
      active: json['active'],
      state: json['state'],
      trim: json['trim'],
      clickoffUrl: json['clickoffUrl'],
      acceptsLeads: json['acceptsLeads'],
      bodyType: json['bodyType'],
      bodyStyle: json['bodyStyle'],
      trackingParams: TrackingParams.fromJson(json['trackingParams']),
      providerGroupId: json['providerGroupId'],
      mileageUnformatted: json['mileageUnformatted'],
      mileageHumanized: json['mileageHumanized'],
      priceMobile: json['priceMobile'],
      priceUnformatted: json['priceUnformatted'],
      recentPriceDrop: json['recentPriceDrop'],
      vdpUrl: json['vdpUrl'],
      showNewMileage: json['showNewMileage'],
      eligibleForFinancing: json['eligibleForFinancing'],
      financingExperience: json['financingExperience'],
      photoUrls: List<String>.from(json['photoUrls']),
      isHot: json['isHot'],
      hrefTarget: json['hrefTarget'],
      distanceFromOrigin: json['distanceFromOrigin'],
      providerName: json['providerName'],
      availableNationwide: json['availableNationwide'],
      regional: json['regional'],
      thumbnailUrl: json['thumbnailUrl'],
      thumbnailUrlLarge: json['thumbnailUrlLarge'],
    );
  }
}

class TrackingParams {
  final String idFromProvider;
  final String remoteDealerId;
  final String dealerName;
  final String remoteSku;
  final String experience;
  final String? rooftopUniqueName;
  final String? rooftopUuid;
  final String dealerUniqueName;
  final String dealerUuid;
  final String dealerGroupUniqueName;
  final String dealerGroupUuid;

  TrackingParams({
    required this.idFromProvider,
    required this.remoteDealerId,
    required this.dealerName,
    required this.remoteSku,
    required this.experience,
    this.rooftopUniqueName,
    this.rooftopUuid,
    required this.dealerUniqueName,
    required this.dealerUuid,
    required this.dealerGroupUniqueName,
    required this.dealerGroupUuid,
  });

  factory TrackingParams.fromJson(Map<String, dynamic> json) {
    return TrackingParams(
      idFromProvider: json['idFromProvider'],
      remoteDealerId: json['remoteDealerId'],
      dealerName: json['dealerName'],
      remoteSku: json['remoteSku'],
      experience: json['experience'],
      rooftopUniqueName: json['rooftopUniqueName'],
      rooftopUuid: json['rooftopUuid'],
      dealerUniqueName: json['dealerUniqueName'],
      dealerUuid: json['dealerUuid'],
      dealerGroupUniqueName: json['dealerGroupUniqueName'],
      dealerGroupUuid: json['dealerGroupUuid'],
    );
  }
}
