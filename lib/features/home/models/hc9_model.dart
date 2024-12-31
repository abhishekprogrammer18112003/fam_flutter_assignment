class Hc9Model {
  Hc9Model({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.height,
    required this.isFullWidth,
    required this.slug,
    required this.level,
  });
  late final int id;
  late final String name;
  late final String designType;
  late final int cardType;
  late final List<Cards> cards;
  late final bool isScrollable;
  late final int height;
  late final bool isFullWidth;
  late final String slug;
  late final int level;
  
  Hc9Model.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    designType = json['design_type'];
    cardType = json['card_type'];
    cards = List.from(json['cards']).map((e)=>Cards.fromJson(e)).toList();
    isScrollable = json['is_scrollable'];
    height = json['height'];
    isFullWidth = json['is_full_width'];
    slug = json['slug'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['design_type'] = designType;
    _data['card_type'] = cardType;
    _data['cards'] = cards.map((e)=>e.toJson()).toList();
    _data['is_scrollable'] = isScrollable;
    _data['height'] = height;
    _data['is_full_width'] = isFullWidth;
    _data['slug'] = slug;
    _data['level'] = level;
    return _data;
  }
}

class Cards {
  Cards({
    required this.id,
    required this.name,
    required this.slug,
    required this.positionalImages,
    required this.components,
    required this.bgImage,
    required this.bgGradient,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final List<dynamic> positionalImages;
  late final List<dynamic> components;
  late final BgImage bgImage;
  late final BgGradient bgGradient;
  late final bool isDisabled;
  late final bool isShareable;
  late final bool isInternal;
  
  Cards.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    positionalImages = List.castFrom<dynamic, dynamic>(json['positional_images']);
    components = List.castFrom<dynamic, dynamic>(json['components']);
    bgImage = BgImage.fromJson(json['bg_image']);
    bgGradient = BgGradient.fromJson(json['bg_gradient']);
    isDisabled = json['is_disabled'];
    isShareable = json['is_shareable'];
    isInternal = json['is_internal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['positional_images'] = positionalImages;
    _data['components'] = components;
    _data['bg_image'] = bgImage.toJson();
    _data['bg_gradient'] = bgGradient.toJson();
    _data['is_disabled'] = isDisabled;
    _data['is_shareable'] = isShareable;
    _data['is_internal'] = isInternal;
    return _data;
  }
}

class BgImage {
  BgImage({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });
  late final String imageType;
  late final String imageUrl;
  late final double? aspectRatio;
  
  BgImage.fromJson(Map<String, dynamic> json){
    imageType = json['image_type'];
    imageUrl = json['image_url'];
     aspectRatio = json['aspect_ratio'] != null
        ? (json['aspect_ratio'] is int
            ? (json['aspect_ratio'] as int).toDouble()
            : json['aspect_ratio'] as double)
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_type'] = imageType;
    _data['image_url'] = imageUrl;
    _data['aspect_ratio'] = aspectRatio;
    return _data;
  }
}

class BgGradient {
  BgGradient({
    required this.angle,
    required this.colors,
  });
  late final int angle;
  late final List<String> colors;
  
  BgGradient.fromJson(Map<String, dynamic> json){
    angle = json['angle'];
    colors = List.castFrom<dynamic, String>(json['colors']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['angle'] = angle;
    _data['colors'] = colors;
    return _data;
  }
}