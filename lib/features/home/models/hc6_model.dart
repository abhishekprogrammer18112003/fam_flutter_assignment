class Hc6Model {
  Hc6Model({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.height,
    required this.isFullWidth,
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
  late final int level;
  
  Hc6Model.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    designType = json['design_type'];
    cardType = json['card_type'];
    cards = List.from(json['cards']).map((e)=>Cards.fromJson(e)).toList();
    isScrollable = json['is_scrollable'];
    height = json['height'];
    isFullWidth = json['is_full_width'];
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
    _data['level'] = level;
    return _data;
  }
}

class Cards {
  Cards({
    required this.id,
    required this.name,
    required this.slug,
    required this.title,
    required this.formattedTitle,
    required this.icon,
    required this.positionalImages,
    required this.components,
    required this.url,
    required this.bgColor,
    required this.iconSize,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String title;
  late final FormattedTitle formattedTitle;
  late final Icon icon;
  late final List<dynamic> positionalImages;
  late final List<dynamic> components;
  late final String url;
  late final String bgColor;
  late final int iconSize;
  late final bool isDisabled;
  late final bool isShareable;
  late final bool isInternal;
  
  Cards.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    title = json['title'];
    formattedTitle = FormattedTitle.fromJson(json['formatted_title']);
    icon = Icon.fromJson(json['icon']);
    positionalImages = List.castFrom<dynamic, dynamic>(json['positional_images']);
    components = List.castFrom<dynamic, dynamic>(json['components']);
    url = json['url'];
    bgColor = json['bg_color'];
    iconSize = json['icon_size'];
    isDisabled = json['is_disabled'];
    isShareable = json['is_shareable'];
    isInternal = json['is_internal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['formatted_title'] = formattedTitle.toJson();
    _data['icon'] = icon.toJson();
    _data['positional_images'] = positionalImages;
    _data['components'] = components;
    _data['url'] = url;
    _data['bg_color'] = bgColor;
    _data['icon_size'] = iconSize;
    _data['is_disabled'] = isDisabled;
    _data['is_shareable'] = isShareable;
    _data['is_internal'] = isInternal;
    return _data;
  }
}

class FormattedTitle {
  FormattedTitle({
    required this.text,
    required this.align,
    required this.entities,
  });
  late final String text;
  late final String align;
  late final List<Entities> entities;
  
  FormattedTitle.fromJson(Map<String, dynamic> json){
    text = json['text'];
    align = json['align'];
    entities = List.from(json['entities']).map((e)=>Entities.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['align'] = align;
    _data['entities'] = entities.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Entities {
  Entities({
    required this.text,
    required this.type,
    required this.color,
    required this.fontStyle,
    required this.fontFamily,
  });
  late final String text;
  late final String type;
  late final String color;
  late final String fontStyle;
  late final String fontFamily;
  
  Entities.fromJson(Map<String, dynamic> json){
    text = json['text'];
    type = json['type'];
    color = json['color'];
    fontStyle = json['font_style'];
    fontFamily = json['font_family'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['type'] = type;
    _data['color'] = color;
    _data['font_style'] = fontStyle;
    _data['font_family'] = fontFamily;
    return _data;
  }
}

class Icon {
  Icon({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });
  late final String imageType;
  late final String imageUrl;
  late final int aspectRatio;
  
  Icon.fromJson(Map<String, dynamic> json){
    imageType = json['image_type'];
    imageUrl = json['image_url'];
    aspectRatio = json['aspect_ratio'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_type'] = imageType;
    _data['image_url'] = imageUrl;
    _data['aspect_ratio'] = aspectRatio;
    return _data;
  }
}