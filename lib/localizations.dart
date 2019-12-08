import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';


class AppLocalizations{
  static AppLocalizations of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }


static Future<AppLocalizations> load(Locale locale){
  final String name=
      locale.countryCode==null?locale.languageCode:locale.toString();
      final String localName = Intl.canonicalizedLocale(name);

  return initializeMessages(localName).then((bool _){
   Intl.defaultLocale = localName;
   return new AppLocalizations();
  });
}

String get title{
  return Intl.message('Kaf',name: 'title');
}

String get loginWith{
  return Intl.message('Login with',name: 'loginWith');
}

String get yourEmail{
  return Intl.message('YOUR EMAIL',name: 'yourEmail');
}

String get startHere{
  return Intl.message('Start here',name: 'startHere');
}

String get areYouNew{
  return Intl.message('Are you new?',name: 'areYouNew');
}
String get logIn{
  return Intl.message('LOGIN',name: 'logIn');
}

String get userName{
  return Intl.message('Username',name: 'userName');
}
String get password{
  return Intl.message('Password',name: 'password');
}
String get forgetPassword{
  return Intl.message('Forgot Password?',name: 'forgetPassword');
}
String get fullName{
  return Intl.message('Full name',name: 'fullName');
}
String get email{
  return Intl.message('E-mail',name: 'email');
}
String get phone{
  return Intl.message('Phone',name: 'phone');
}
String get signUp{
  return Intl.message('SIGN UP',name: 'signUp');
}
String get selectYour{
  return Intl.message('Select your',name: 'selectYour');
}
String get location{
  return Intl.message('location ',name: 'location');
}
String get toHelpFindTheNearest{
  return Intl.message('to help find the nearest',name: 'toHelpFindTheNearest');
}
String get serviceForYou{
  return Intl.message('service for you',name: 'serviceForYou');
}
String get setLocation{
  return Intl.message('Set Location',name: 'setLocation');
}
String get skip{
  return Intl.message('Skip',name: 'skip');
}
String get selectYourCity{
  return Intl.message('Select your city',name: 'selectYourCity');
}
String get useCurrentLocation{
  return Intl.message('Use current location',name: 'useCurrentLocation');
}
String get enterCode{
  return Intl.message('Enter code',name: 'enterCode');
}
String get weHaveSent{
  return Intl.message('We have sent you an SMS on +92 7020764458 with 6 digit verification code.',name: 'weHaveSent');
}
String get submit{
  return Intl.message('Submit',name: 'submit');
}
String get didNotReceiveTheCode{
  return Intl.message('Did not receive the code?',name: 'didNotReceiveTheCode');
}
String get getACallNow{
  return Intl.message('Get a call now',name: 'getACallNow');
}
String get resent{
  return Intl.message('Re-send',name: 'resent');
}
String get support{
  return Intl.message('Support',name: 'support');
}
String get home{
  return Intl.message('Home',name: 'home');
}
String get offers{
  return Intl.message('Offers',name: 'offers');
}
String get completYourProfile{
  return Intl.message('Complete your profile',name: 'completYourProfile');
}
String get myOffers{
  return Intl.message('My Offers',name: 'myOffers');
}
String get myDonations{
  return Intl.message('My Donations',name: 'myDonations');
}
String get myFavorite{
  return Intl.message('My Favourite',name: 'myFavorite');
}
String get language{
  return Intl.message('Language',name: 'language');
}
String get help{
  return Intl.message('Help',name: 'help');
}
String get aboutKaf{
  return Intl.message('About Kaf',name: 'aboutKaf');
}
String get copyRight{
  return Intl.message('Copyright © KAF 2019',name: 'copyRight');
}
String get bestDeals{
  return Intl.message('Best Deals',name: 'bestDeals');
}
String get benefactor{
  return Intl.message('Benefactor',name: 'benefactor');
}
String get bestOffers{
  return Intl.message('Best Offers',name: 'bestOffers');
}
String get lookForDonation{
  return Intl.message('Look for a donation',name: 'lookForDonation');
}
String get theHoly{
  return Intl.message('The Holy Prophet ',name: 'theHoly');
}
String get says{
  return Intl.message('(Sallallahu alaihi wa sallam) says:',name: 'says');
}
String get theBestPerson{
  return Intl.message('The best person is the one who benefits all ',name: 'theBestPerson');
}
String get humanBegin{
  return Intl.message('human beings.',name: 'humanBegin');
}
String get writeYourNeed{
  return Intl.message('write your need here..',name: 'writeYourNeed');
}
String get addLocation{
  return Intl.message('أAdd location',name: 'addLocation');
}
String get addPhoto{
  return Intl.message('Add photo',name: 'addPhoto');
}
String get gender{
  return Intl.message('Gender',name: 'gender');
}
String get male{
  return Intl.message('Male',name: 'male');
}
String get female{
  return Intl.message('Female',name: 'female');
}

String get selectBlood{
  return Intl.message('Select Blood Group',name: 'selectBlood');
}
String get doYouWantToMake{
  return Intl.message('Do you want to make your contact number\n visible for other',name: 'doYouWantToMake');
}
String get addYourNeed{
  return Intl.message('Add your need',name: 'addYourNeed');
}
String get ago {
  return Intl.message('ago',name: 'ago');
}
String get helpHimNow{
  return Intl.message('Help him now',name: 'helpHimNow');
}
String get search{
  return Intl.message('Search',name: 'search');
}
String get searchForAll{
  return Intl.message('Search For All',name: 'searchForAll');
}
String get doctorsAnd{
  return Intl.message('Doctors, specialities, clinics',name: 'doctorsAnd');
}
String get filter{
  return Intl.message('Filter',name: 'filter');
}
String get clearFilter{
  return Intl.message('Clear Filter',name: 'clearFilter');
}
String get sortedBy{
  return Intl.message('Sort By',name: 'sortedBy');
}
String get lowestPrice{
  return Intl.message('Lowest price',name: 'lowestPrice');
}
String get closestToYou{
  return Intl.message('Closest to you',name: 'closestToYou');
}
String get availability{
  return Intl.message('Availability',name: 'availability');
}
String get availableAnyDay{
  return Intl.message('Available Any Day',name: 'availableAnyDay');
}
String get  availableToday {
  return Intl.message('Available Today',name: 'availableToday');
}
String get availableInNext3Days{
  return Intl.message('Available in next 3 days',name: 'availableInNext3Days');
}
String get availableComingWeekend {
  return Intl.message('Available coming weekend',name: 'availableComingWeekend');
}
String get price {
  return Intl.message('Price',name: 'price');
}
String get free{
  return Intl.message('Free',name: 'free');
}
String get one200 {
  return Intl.message('1-200',name: 'one200');
}
String get two500{
  return Intl.message('201-500',name: 'two500');
}
String get five1000{
  return Intl.message('500-1000',name: 'five1000');
}
String get know{
  return Intl.message('Knowledge',name: 'know');
}
String get sr{
  return Intl.message('SR',name: 'sr');
}
String get allTimaing{
  return Intl.message('All Timing',name: 'allTimaing');
}
String get closedToday{
  return Intl.message('CLOSED TODAY',name: 'closedToday');
}
String get moreDetails{
  return Intl.message('More Details',name: 'moreDetails');
}
String get viewAllFeedBack{
  return Intl.message('View ALL FEEDBACK',name: 'viewAllFeedBack');
}
String get takeThisOffer{
  return Intl.message('Take this offer',name: 'takeThisOffer');
}
String get conditionForAbtaining{
  return Intl.message('Conditions for obtaining this offer',name: 'conditionForAbtaining');
}
String get feedback{
  return Intl.message('FEEDBACK',name: 'feedback');
}
String get yearsExperience{
  return Intl.message('Years \n Experience',name: 'yearsExperience');
}
String get discription{
  return Intl.message('Discription',name: 'discription');
}
String get donerInfo{
  return Intl.message('Donor Information',name: 'donerInfo');
}
String get birthDate{
  return Intl.message('Date of Birth',name: 'birthDate');
}
String get done{
  return Intl.message('Done',name: 'done');
}
String get results{
  return Intl.message('result',name: 'results');
}
String get rating{
  return Intl.message('Rating',name: 'rating');
}
}


class SprcificLocalizationDelegate extends LocalizationsDelegate<AppLocalizations>{
 final Locale overriddenLocale;

  SprcificLocalizationDelegate(this.overriddenLocale);
  @override
  bool isSupported(Locale locale)=> overriddenLocale!=null;

  @override
  Future<AppLocalizations> load(Locale locale)=>
  AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old)=>
  true;
  
}