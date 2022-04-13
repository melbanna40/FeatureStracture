class HomeModel {
  Home? data;
  String? message;
  int? status;

  HomeModel({this.data, this.message, this.status});

  HomeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Home.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Home {
  List<FeaturedCourses>? featuredCourses;
  List<Categories>? categories;
  List<LiveCourses>? liveCourses;
  List<FreeCourses>? freeCourses;

  Home(
      {this.featuredCourses,
      this.categories,
      this.liveCourses,
      this.freeCourses});

  Home.fromJson(Map<String, dynamic> json) {
    if (json['featured_courses'] != null) {
      featuredCourses = <FeaturedCourses>[];
      json['featured_courses'].forEach((v) {
        featuredCourses!.add(new FeaturedCourses.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['live_courses'] != null) {
      liveCourses = <LiveCourses>[];
      json['live_courses'].forEach((v) {
        liveCourses!.add(new LiveCourses.fromJson(v));
      });
    }
    if (json['free_courses'] != null) {
      freeCourses = <FreeCourses>[];
      json['free_courses'].forEach((v) {
        freeCourses!.add(new FreeCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featuredCourses != null) {
      data['featured_courses'] =
          this.featuredCourses!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.liveCourses != null) {
      data['live_courses'] = this.liveCourses!.map((v) => v.toJson()).toList();
    }
    if (this.freeCourses != null) {
      data['free_courses'] = this.freeCourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedCourses {
  int? id;
  String? title;
  String? slug;
  String? duration;
  String? image;
  String? thumbnail;
  int? price;
  int? discountPrice;
  int? publish;
  int? status;
  int? level;
  String? trailerLink;
  String? host;
  String? metaKeywords;
  String? metaDescription;
  int? totalEnrolled;
  int? totalRating;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  FeaturedCourses(
      {this.id,
      this.title,
      this.slug,
      this.duration,
      this.image,
      this.thumbnail,
      this.price,
      this.discountPrice,
      this.publish,
      this.status,
      this.level,
      this.trailerLink,
      this.host,
      this.metaKeywords,
      this.metaDescription,
      this.totalEnrolled,
      this.totalRating,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  FeaturedCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    duration = json['duration'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    discountPrice = json['discount_price'];
    publish = json['publish'];
    status = json['status'];
    level = json['level'];
    trailerLink = json['trailer_link'];
    host = json['host'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    totalEnrolled = json['total_enrolled'];
    totalRating = json['total_rating'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['publish'] = this.publish;
    data['status'] = this.status;
    data['level'] = this.level;
    data['trailer_link'] = this.trailerLink;
    data['host'] = this.host;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['total_enrolled'] = this.totalEnrolled;
    data['total_rating'] = this.totalRating;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  String? thumbnail;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.name,
      this.image,
      this.thumbnail,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LiveCourses {
  int? id;
  String? course;
  String? instructor;
  int? meetingId;
  String? password;
  String? startTime;
  String? endTime;
  String? topic;
  String? description;
  String? joinUrl;
  String? dateOfMeeting;
  String? timeOfMeeting;
  int? meetingDuration;

  LiveCourses(
      {this.id,
      this.course,
      this.instructor,
      this.meetingId,
      this.password,
      this.startTime,
      this.endTime,
      this.topic,
      this.description,
      this.joinUrl,
      this.dateOfMeeting,
      this.timeOfMeeting,
      this.meetingDuration});

  LiveCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course = json['course'];
    instructor = json['instructor'];
    meetingId = json['meeting_id'];
    password = json['password'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    topic = json['topic'];
    description = json['description'];
    joinUrl = json['join_url'];
    dateOfMeeting = json['date_of_meeting'];
    timeOfMeeting = json['time_of_meeting'];
    meetingDuration = json['meeting_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course'] = this.course;
    data['instructor'] = this.instructor;
    data['meeting_id'] = this.meetingId;
    data['password'] = this.password;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['topic'] = this.topic;
    data['description'] = this.description;
    data['join_url'] = this.joinUrl;
    data['date_of_meeting'] = this.dateOfMeeting;
    data['time_of_meeting'] = this.timeOfMeeting;
    data['meeting_duration'] = this.meetingDuration;
    return data;
  }
}

class FreeCourses {
  int? id;
  String? title;
  String? slug;
  String? duration;
  String? image;
  String? thumbnail;
  int? price;
  int? discountPrice;
  int? publish;
  int? status;
  int? level;
  String? trailerLink;
  String? host;
  String? metaKeywords;
  String? metaDescription;
  int? totalEnrolled;
  int? totalRating;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  FreeCourses(
      {this.id,
      this.title,
      this.slug,
      this.duration,
      this.image,
      this.thumbnail,
      this.price,
      this.discountPrice,
      this.publish,
      this.status,
      this.level,
      this.trailerLink,
      this.host,
      this.metaKeywords,
      this.metaDescription,
      this.totalEnrolled,
      this.totalRating,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  FreeCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    duration = json['duration'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    discountPrice = json['discount_price'];
    publish = json['publish'];
    status = json['status'];
    level = json['level'];
    trailerLink = json['trailer_link'];
    host = json['host'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    totalEnrolled = json['total_enrolled'];
    totalRating = json['total_rating'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['publish'] = this.publish;
    data['status'] = this.status;
    data['level'] = this.level;
    data['trailer_link'] = this.trailerLink;
    data['host'] = this.host;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['total_enrolled'] = this.totalEnrolled;
    data['total_rating'] = this.totalRating;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
