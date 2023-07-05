import 'dart:convert';
import 'package:flutter/material.dart';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.dateOnSaleFrom,
    required this.dateOnSaleFromGmt,
    required this.dateOnSaleTo,
    required this.dateOnSaleToGmt,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    required this.stockQuantity,
    required this.locations,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.lowStockAmount,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.priceHtml,
    required this.relatedIds,
    required this.metaData,
    required this.stockStatus,
    required this.hasOptions,
    required this.links,
  });

  int id;
  String name;
  String slug;
  String permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String type;
  String status;
  bool featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool onSale;
  bool purchasable;
  dynamic totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  String taxStatus;
  String taxClass;
  bool manageStock;
  int? stockQuantity;
  List<Locations?>? locations;
  String backorders;
  bool backordersAllowed;
  bool backordered;
  dynamic lowStockAmount;
  bool soldIndividually;
  String weight;
  Dimensions dimensions;
  bool shippingRequired;
  bool shippingTaxable;
  String shippingClass;
  int shippingClassId;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<dynamic> upsellIds;
  List<dynamic> crossSellIds;
  int parentId;
  String purchaseNote;
  List<Category> categories;
  List<Category> tags;
  List<ImageProduct> images;
  List<Attribute> attributes;
  List<DefaultAttribute> defaultAttributes;
  List<int> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  String priceHtml;
  List<int> relatedIds;
  List<MetaDatum> metaData;
  String stockStatus;
  bool hasOptions;
  Links links;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        locations: json["locations"] == null
            ? null
            : List<Locations>.from(
                json["locations"].map((x) => Locations.fromJson(x))),
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        tags:
            List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
        images: List<ImageProduct>.from(
            json["images"].map((x) => ImageProduct.fromJson(x))),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        defaultAttributes: List<DefaultAttribute>.from(
            json["default_attributes"]
                .map((x) => DefaultAttribute.fromJson(x))),
        variations: List<int>.from(json["variations"].map((x) => x)),
        groupedProducts:
            List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        metaData: List<MetaDatum>.from(
            json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated!.toIso8601String(),
        "date_created_gmt": dateCreatedGmt!.toIso8601String(),
        "date_modified": dateModified!.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt!.toIso8601String(),
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": List<dynamic>.from(downloads.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "locations": List<Locations>.from(locations!.map((x) => x)),
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
        "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "default_attributes":
            List<dynamic>.from(defaultAttributes.map((x) => x.toJson())),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "_links": links.toJson(),
      };

  ProductsModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? permalink,
    DateTime? dateCreated,
    DateTime? dateCreatedGmt,
    DateTime? dateModified,
    DateTime? dateModifiedGmt,
    String? type,
    String? status,
    bool? featured,
    String? catalogVisibility,
    String? description,
    String? shortDescription,
    String? sku,
    String? price,
    String? regularPrice,
    String? salePrice,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleFromGmt,
    dynamic dateOnSaleTo,
    dynamic dateOnSaleToGmt,
    bool? onSale,
    bool? purchasable,
    dynamic totalSales,
    bool? virtual,
    bool? downloadable,
    List<dynamic>? downloads,
    int? downloadLimit,
    int? downloadExpiry,
    String? externalUrl,
    String? buttonText,
    String? taxStatus,
    String? taxClass,
    bool? manageStock,
    int? stockQuantity,
    List<Locations>? locations,
    String? backorders,
    bool? backordersAllowed,
    bool? backordered,
    dynamic lowStockAmount,
    bool? soldIndividually,
    String? weight,
    Dimensions? dimensions,
    bool? shippingRequired,
    bool? shippingTaxable,
    String? shippingClass,
    int? shippingClassId,
    bool? reviewsAllowed,
    String? averageRating,
    int? ratingCount,
    List<dynamic>? upsellIds,
    List<dynamic>? crossSellIds,
    int? parentId,
    String? purchaseNote,
    List<Category>? categories,
    List<Category>? tags,
    List<ImageProduct>? images,
    List<Attribute>? attributes,
    List<DefaultAttribute>? defaultAttributes,
    List<int>? variations,
    List<dynamic>? groupedProducts,
    int? menuOrder,
    String? priceHtml,
    List<int>? relatedIds,
    List<MetaDatum>? metaData,
    String? stockStatus,
    bool? hasOptions,
    Links? links,
  }) =>
      ProductsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        permalink: permalink ?? this.permalink,
        dateCreated: dateCreated ?? this.dateCreated,
        dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
        dateModified: dateModified ?? this.dateModified,
        dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
        type: type ?? this.type,
        status: status ?? this.status,
        featured: featured ?? this.featured,
        catalogVisibility: catalogVisibility ?? this.catalogVisibility,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        sku: sku ?? this.sku,
        price: price ?? this.price,
        regularPrice: regularPrice ?? this.regularPrice,
        salePrice: salePrice ?? this.salePrice,
        dateOnSaleFrom: dateOnSaleFrom ?? this.dateOnSaleFrom,
        dateOnSaleFromGmt: dateOnSaleFromGmt ?? this.dateOnSaleFromGmt,
        dateOnSaleTo: dateOnSaleTo ?? this.dateOnSaleTo,
        dateOnSaleToGmt: dateOnSaleToGmt ?? this.dateOnSaleToGmt,
        priceHtml: priceHtml ?? this.priceHtml,
        onSale: onSale ?? this.onSale,
        purchasable: purchasable ?? this.purchasable,
        totalSales: totalSales ?? this.totalSales,
        virtual: virtual ?? this.virtual,
        downloadable: downloadable ?? this.downloadable,
        downloads: downloads ?? this.downloads,
        downloadLimit: downloadLimit ?? this.downloadLimit,
        downloadExpiry: downloadExpiry ?? this.downloadExpiry,
        externalUrl: externalUrl ?? this.externalUrl,
        buttonText: buttonText ?? this.buttonText,
        taxStatus: taxStatus ?? this.taxStatus,
        taxClass: taxClass ?? this.taxClass,
        manageStock: manageStock ?? this.manageStock,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        locations: locations ?? this.locations,
        stockStatus: stockStatus ?? this.stockStatus,
        backorders: backorders ?? this.backorders,
        backordersAllowed: backordersAllowed ?? this.backordersAllowed,
        backordered: backordered ?? this.backordered,
        soldIndividually: soldIndividually ?? this.soldIndividually,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        shippingRequired: shippingRequired ?? this.shippingRequired,
        shippingTaxable: shippingTaxable ?? this.shippingTaxable,
        shippingClass: shippingClass ?? this.shippingClass,
        shippingClassId: shippingClassId ?? this.shippingClassId,
        reviewsAllowed: reviewsAllowed ?? this.reviewsAllowed,
        averageRating: averageRating ?? this.averageRating,
        ratingCount: ratingCount ?? this.ratingCount,
        relatedIds: relatedIds ?? this.relatedIds,
        upsellIds: upsellIds ?? this.upsellIds,
        crossSellIds: crossSellIds ?? this.crossSellIds,
        parentId: parentId ?? this.parentId,
        purchaseNote: purchaseNote ?? this.purchaseNote,
        categories: categories ?? this.categories,
        tags: tags ?? this.tags,
        images: images ?? this.images,
        attributes: attributes ?? this.attributes,
        defaultAttributes: defaultAttributes ?? this.defaultAttributes,
        variations: variations ?? this.variations,
        groupedProducts: groupedProducts ?? this.groupedProducts,
        menuOrder: menuOrder ?? this.menuOrder,
        metaData: metaData ?? this.metaData,
        links: links ?? this.links,
        hasOptions: hasOptions ?? this.hasOptions,
        lowStockAmount: lowStockAmount ?? this.lowStockAmount,
      );
}

class Attribute {
  Attribute({
    required this.id,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        visible: json["visible"],
        variation: json["variation"],
        options: List<String>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "visible": visible,
        "variation": variation,
        "options": List<dynamic>.from(options.map((x) => x)),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Locations {
  Locations({
    required this.id,
    required this.name,
    required this.slug,
    required this.quantity,
  });

  int id;
  String name;
  String slug;
  String quantity;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      quantity: json["quantity"] ?? '0');

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "slug": slug, "quantity": quantity};

  Locations copyWith({
    int? id,
    String? name,
    String? slug,
    String? quantity,
  }) =>
      Locations(
          id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          quantity: quantity ?? this.quantity);
}

class DefaultAttribute {
  DefaultAttribute({
    required this.id,
    required this.name,
    required this.option,
  });

  int id;
  String name;
  String option;

  factory DefaultAttribute.fromJson(Map<String, dynamic> json) =>
      DefaultAttribute(
        id: json["id"],
        name: json["name"],
        option: json["option"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "option": option,
      };
}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  String length;
  String width;
  String height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class ImageProduct {
  ImageProduct({
    required this.id,
    required this.src,
    required this.name,
    required this.alt,
  });

  int id;
  String? src;
  String name;
  String alt;

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
        id: json["id"],
        src: json["src"] ??
            Image.network(
              'https://icomroma.com/vendita/wp-content/uploads/woocommerce-placeholder.png',
            ),
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class JetpackRelatedPost {
  JetpackRelatedPost({
    required this.id,
    required this.url,
    required this.urlMeta,
    required this.title,
    required this.date,
    required this.format,
    required this.excerpt,
    required this.rel,
    required this.context,
    required this.img,
    required this.classes,
  });

  int id;
  String url;
  UrlMeta urlMeta;
  String title;
  String date;
  bool format;
  String excerpt;
  String rel;
  String context;
  Img img;
  List<dynamic> classes;

  factory JetpackRelatedPost.fromJson(Map<String, dynamic> json) =>
      JetpackRelatedPost(
        id: json["id"],
        url: json["url"],
        urlMeta: UrlMeta.fromJson(json["url_meta"]),
        title: json["title"],
        date: json["date"],
        format: json["format"],
        excerpt: json["excerpt"],
        rel: json["rel"],
        context: json["context"],
        img: Img.fromJson(json["img"]),
        classes: List<dynamic>.from(json["classes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "url_meta": urlMeta.toJson(),
        "title": title,
        "date": date,
        "format": format,
        "excerpt": excerpt,
        "rel": rel,
        "context": context,
        "img": img.toJson(),
        "classes": List<dynamic>.from(classes.map((x) => x)),
      };
}

class Img {
  Img({
    required this.altText,
    required this.src,
    required this.width,
    required this.height,
  });

  String altText;
  String src;
  int width;
  int height;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        altText: json["alt_text"],
        src: json["src"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "alt_text": altText,
        "src": src,
        "width": width,
        "height": height,
      };
}

class UrlMeta {
  UrlMeta({
    required this.origin,
    required this.position,
  });

  int origin;
  int position;

  factory UrlMeta.fromJson(Map<String, dynamic> json) => UrlMeta(
        origin: json["origin"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "position": position,
      };
}

class Links {
  Links({
    required this.self,
    required this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class MetaDatum {
  MetaDatum({
    this.id,
    this.key,
    required this.value,
  });

  int? id;
  String? key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

class ValueElement {
  ValueElement({
    required this.sede,
    required this.quantita,
  });

  String sede;
  int quantita;

  factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
        sede: json["sede"],
        quantita: json["quantita"],
      );

  Map<String, dynamic> toJson() => {
        "sede": sede,
        "quantita": quantita,
      };
}

class PurpleValue {
  PurpleValue({
    required this.the32B0Bf150Bb6Bd30C74Ed5Fafdacd61F,
    required this.the414C5E39686B80472Dfd19Eb68D5Cbda,
    required this.it,
    required this.stylesDescriptor,
    required this.the06122022,
  });

  The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F the32B0Bf150Bb6Bd30C74Ed5Fafdacd61F;
  The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F the414C5E39686B80472Dfd19Eb68D5Cbda;
  String it;
  StylesDescriptor stylesDescriptor;
  The06122022 the06122022;

  factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
        the32B0Bf150Bb6Bd30C74Ed5Fafdacd61F:
            The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F.fromJson(
                json["32b0bf150bb6bd30c74ed5fafdacd61f"]),
        the414C5E39686B80472Dfd19Eb68D5Cbda:
            The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F.fromJson(
                json["414c5e39686b80472dfd19eb68d5cbda"]),
        it: json["IT"],
        stylesDescriptor: StylesDescriptor.fromJson(json["styles_descriptor"]),
        the06122022: The06122022.fromJson(json["06-12-2022"]),
      );

  Map<String, dynamic> toJson() => {
        "32b0bf150bb6bd30c74ed5fafdacd61f":
            the32B0Bf150Bb6Bd30C74Ed5Fafdacd61F.toJson(),
        "414c5e39686b80472dfd19eb68d5cbda":
            the414C5E39686B80472Dfd19Eb68D5Cbda.toJson(),
        "IT": it,
        "styles_descriptor": stylesDescriptor.toJson(),
        "06-12-2022": the06122022.toJson(),
      };
}

class StylesDescriptor {
  StylesDescriptor({
    required this.styles,
    required this.googleFonts,
    required this.version,
  });

  Styles styles;
  List<dynamic> googleFonts;
  int version;

  factory StylesDescriptor.fromJson(Map<String, dynamic> json) =>
      StylesDescriptor(
        styles: Styles.fromJson(json["styles"]),
        googleFonts: List<dynamic>.from(json["google_fonts"].map((x) => x)),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "styles": styles.toJson(),
        "google_fonts": List<dynamic>.from(googleFonts.map((x) => x)),
        "version": version,
      };
}

class Styles {
  Styles({
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  String desktop;
  String tablet;
  String mobile;

  factory Styles.fromJson(Map<String, dynamic> json) => Styles(
        desktop: json["desktop"],
        tablet: json["tablet"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "desktop": desktop,
        "tablet": tablet,
        "mobile": mobile,
      };
}

class The06122022 {
  The06122022({
    required this.impressions,
  });

  int impressions;

  factory The06122022.fromJson(Map<String, dynamic> json) => The06122022(
        impressions: json["impressions"],
      );

  Map<String, dynamic> toJson() => {
        "impressions": impressions,
      };
}

class The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F {
  The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F({
    required this.expires,
    required this.payload,
  });

  int expires;
  List<Payload> payload;

  factory The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F.fromJson(
          Map<String, dynamic> json) =>
      The32B0Bf150Bb6Bd30C74Ed5Fafdacd61F(
        expires: json["expires"],
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "expires": expires,
        "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
      };
}

class Payload {
  Payload({
    required this.id,
  });

  int id;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class YoastHeadJson {
  YoastHeadJson({
    required this.title,
    required this.description,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogDescription,
    required this.ogUrl,
    required this.ogSiteName,
    required this.articleModifiedTime,
    required this.ogImage,
    required this.twitterCard,
    required this.twitterMisc,
    required this.schema,
  });

  String? title;
  String? description;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  String? ogSiteName;
  DateTime? articleModifiedTime;
  List<OgImage>? ogImage;
  String? twitterCard;
  TwitterMisc? twitterMisc;
  Schema? schema;

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        description: json["description"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        articleModifiedTime: json["article_modified_time"] == null
            ? DateTime.now()
            : DateTime.parse(json["article_modified_time"]),
        ogImage: json["og_image"] == null
            ? null
            : List<OgImage>.from(
                json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: json["twitter_card"],
        twitterMisc: json["twitter_misc"] == null
            ? null
            : TwitterMisc.fromJson(json["twitter_misc"]),
        schema: Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots!.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_modified_time": articleModifiedTime!.toIso8601String(),
        "og_image": List<dynamic>.from(ogImage!.map((x) => x.toJson())),
        "twitter_card": twitterCard,
        "twitter_misc": twitterMisc!.toJson(),
        "schema": schema!.toJson(),
      };
}

class OgImage {
  OgImage({
    required this.width,
    required this.height,
    required this.url,
    required this.type,
  });

  int width;
  int height;
  String url;
  String type;

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": type,
      };
}

class Robots {
  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  String index;
  String follow;
  String maxSnippet;
  String maxImagePreview;
  String maxVideoPreview;

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
      };
}

class Schema {
  Schema({
    required this.context,
    required this.graph,
  });

  String context;
  List<Graph> graph;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
      };
}

class Graph {
  Graph({
    required this.type,
    required this.id,
    required this.url,
    required this.name,
    required this.isPartOf,
    required this.datePublished,
    required this.dateModified,
    required this.description,
    required this.breadcrumb,
    required this.inLanguage,
    required this.potentialAction,
    required this.itemListElement,
    required this.publisher,
    required this.logo,
    required this.image,
  });

  String? type;
  String? id;
  String? url;
  String? name;
  Breadcrumb? isPartOf;
  String? datePublished;
  DateTime? dateModified;
  String? description;
  Breadcrumb? breadcrumb;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  List<ItemListElement>? itemListElement;
  Breadcrumb? publisher;
  Logo? logo;
  Breadcrumb? image;

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        url: json["url"],
        name: json["name"],
        isPartOf: json["isPartOf"] == null
            ? null
            : Breadcrumb.fromJson(json["isPartOf"]),
        datePublished: json["datePublished"],
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
        breadcrumb: json["breadcrumb"] == null
            ? null
            : Breadcrumb.fromJson(json["breadcrumb"]),
        inLanguage: json["inLanguage"],
        itemListElement: json["itemListElement"] == null
            ? null
            : List<ItemListElement>.from(json["itemListElement"]
                .map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
        publisher: json["publisher"] == null
            ? null
            : Breadcrumb.fromJson(json["publisher"]),
        potentialAction: json["potentialAction"] == null
            ? null
            : List<PotentialAction>.from(json["potentialAction"]
                .map((x) => PotentialAction.fromJson(x))),
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
        image:
            json["image"] == null ? null : Breadcrumb.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "url": url,
        "name": name,
        "isPartOf": isPartOf!.toJson(),
        "datePublished": datePublished,
        "dateModified": dateModified!.toIso8601String(),
        "description": description,
        "breadcrumb": breadcrumb!.toJson(),
        "inLanguage": inLanguage,
        "potentialAction":
            List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "itemListElement":
            List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "publisher": publisher!.toJson(),
        "logo": logo!.toJson(),
        "image": image!.toJson(),
      };
}

class Breadcrumb {
  Breadcrumb({
    required this.id,
  });

  String id;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

class ItemListElement {
  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    required this.item,
  });

  String type;
  int position;
  String name;
  String? item;

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
      };
}

class Logo {
  Logo({
    required this.type,
    required this.inLanguage,
    required this.id,
    required this.url,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.caption,
  });

  String type;
  String inLanguage;
  String id;
  String url;
  String contentUrl;
  int width;
  int height;
  String caption;

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        type: json["@type"],
        inLanguage: json["inLanguage"],
        id: json["@id"],
        url: json["url"],
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "inLanguage": inLanguage,
        "@id": id,
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": caption,
      };
}

class PotentialAction {
  PotentialAction({
    required this.type,
    required this.target,
    required this.queryInput,
  });

  String type;
  dynamic target;
  String? queryInput;

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: json["@type"],
        target: json["target"],
        queryInput: json["query-input"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target,
        "query-input": queryInput,
      };
}

class TargetClass {
  TargetClass({
    required this.type,
    required this.urlTemplate,
  });

  String type;
  String urlTemplate;

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
      };
}

class TwitterMisc {
  TwitterMisc({
    required this.tempoDiLetturaStimato,
  });

  String tempoDiLetturaStimato;

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        tempoDiLetturaStimato: json["Tempo di lettura stimato"],
      );

  Map<String, dynamic> toJson() => {
        "Tempo di lettura stimato": tempoDiLetturaStimato,
      };
}
