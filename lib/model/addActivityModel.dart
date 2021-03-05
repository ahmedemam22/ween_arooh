import 'dart:io';
class AddActivityModel {
   String companyName;
  String administrationName;
  String countryName;
  String address;
  List<String> branchesAddress;
  String telephone;
  String mobile;
  String fax;
  String email;
  String website;
  List<Map<String,String>> socialMedia;
  String littleDesc;
  String detailedDesc;
  File comLogo;
  List<File> mainBanner;
  List<File> addOffers;
  List<File> addcopoun;
  AddActivityModel({
  this.companyName,this.administrationName,this.countryName,this.address,this.branchesAddress,
  this.telephone,this.mobile,this.fax,this.email,this.website,this.socialMedia,this.littleDesc
  ,this.detailedDesc,this.comLogo,this.mainBanner,this.addOffers,this.addcopoun
});

}