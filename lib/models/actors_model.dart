class Cast {
  List<Actor> actors = [];
  Cast.fromJSonMap(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      for (var element in jsonList) {
        final actor = Actor.fromJsonMap(element);
        actors.add(actor);
      }
    }
  }
}

class Actor {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });
  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['originalName'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }
  String getPosterImg() {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    } else {
      return 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Circle-icons-profile.svg';
    }
  }
}
