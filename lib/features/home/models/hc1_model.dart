class Hc1Model {
  Hc1Model({
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
  
  Hc1Model.fromJson(Map<String, dynamic> json){
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
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.icon,
    this.bgColor,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
  });

  late final int id;
  late final String name;
  late final String slug;
  late final String title;
  late final FormattedTitle? formattedTitle; // Nullable
  late final String? description;
  late final FormattedDescription? formattedDescription; // Nullable
  late final Icon? icon; // Nullable
  late final String? bgColor;
  late final bool isDisabled;
  late final bool isShareable;
  late final bool isInternal;

  Cards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    title = json['title'];
    formattedTitle = json['formatted_title'] != null
        ? FormattedTitle.fromJson(json['formatted_title'])
        : null;
    description = json['description'];
    formattedDescription = json['formatted_description'] != null
        ? FormattedDescription.fromJson(json['formatted_description'])
        : null;
    icon = json['icon'] != null ? Icon.fromJson(json['icon']) : null;
    bgColor = json['bg_color'];
    isDisabled = json['is_disabled'] ?? false;
    isShareable = json['is_shareable'] ?? false;
    isInternal = json['is_internal'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['formatted_title'] = formattedTitle?.toJson();
    _data['description'] = description;
    _data['formatted_description'] = formattedDescription?.toJson();
    _data['icon'] = icon?.toJson();
    _data['bg_color'] = bgColor;
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

class Description {
  Description({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });
  late final String imageType;
  late final String imageUrl;
  late final int aspectRatio;
  
  Description.fromJson(Map<String, dynamic> json){
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

class FormattedDescription {
  FormattedDescription({
    required this.text,
    required this.align,
    required this.entities,
  });
  late final String text;
  late final String align;
  late final List<Entities> entities;
  
  FormattedDescription.fromJson(Map<String, dynamic> json){
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