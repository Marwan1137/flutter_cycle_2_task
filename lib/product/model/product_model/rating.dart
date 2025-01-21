/* -------------------------------------------------------------------------- */
/*                         Rating class to represent rating data             */
/* -------------------------------------------------------------------------- */
class Rating {
  double? rate;
  int? count;

  /* -------------------------------------------------------------------------- */
  /*                        Constructor for initializing Rating                */
  /* -------------------------------------------------------------------------- */
  Rating({this.rate, this.count});

  /* -------------------------------------------------------------------------- */
  /*         Factory constructor to create Rating from JSON data               */
  /* -------------------------------------------------------------------------- */
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json['rate'] as num?)?.toDouble(),
        count: json['count'] as int?,
      );

  /* -------------------------------------------------------------------------- */
  /*               Method to convert Rating to a JSON map representation       */
  /* -------------------------------------------------------------------------- */
  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
