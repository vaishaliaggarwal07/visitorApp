class Visitor {
  final String name;
  final String email;
  final String phone_number;
  final String organization;
  final String purpose;
  final String whom_meet;
  // final String dateSelected;

  Visitor(
      {required this.name,
      required this.email,
      required this.phone_number,
      required this.organization,
      required this.purpose,
      required this.whom_meet,
      // required this.dateSelected,
      
      });

  Map<String, dynamic> toJson() => {
    'name':name,
    'email': email,
    'phone_number': phone_number,
    'organization': organization,
    'purpose': purpose,
    'whom_meet':whom_meet,
    
    // 'dateSelected':dateSelected,
  };
}
