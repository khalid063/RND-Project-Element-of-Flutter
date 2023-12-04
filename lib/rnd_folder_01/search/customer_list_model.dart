class CustomerListModel {
  bool? status;
  int? statusCode;
  List<Data>? data;

  CustomerListModel({this.status, this.statusCode, this.data});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? xcus;
  int? zid;
  String? cusname;
  String? xcname;
  String? phone;
  String? trnNumber;
  String? division;
  String? xzone;
  String? xarea;
  String? xcountry;

  Data(
      {this.xcus,
        this.zid,
        this.cusname,
        this.xcname,
        this.phone,
        this.trnNumber,
        this.division,
        this.xzone,
        this.xarea,
        this.xcountry});

  Data.fromJson(Map<String, dynamic> json) {
    xcus = json['xcus'];
    zid = json['zid'];
    cusname = json['cusname'];
    xcname = json['xcname'];
    phone = json['phone'];
    trnNumber = json['trn_number'];
    division = json['division'];
    xzone = json['xzone'];
    xarea = json['xarea'];
    xcountry = json['xcountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['xcus'] = this.xcus;
    data['zid'] = this.zid;
    data['cusname'] = this.cusname;
    data['xcname'] = this.xcname;
    data['phone'] = this.phone;
    data['trn_number'] = this.trnNumber;
    data['division'] = this.division;
    data['xzone'] = this.xzone;
    data['xarea'] = this.xarea;
    data['xcountry'] = this.xcountry;
    return data;
  }
}
