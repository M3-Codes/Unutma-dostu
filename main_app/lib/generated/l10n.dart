// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Demo`
  String get Demo {
    return Intl.message(
      'Demo',
      name: 'Demo',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signout {
    return Intl.message(
      'Sign out',
      name: 'signout',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get about {
    return Intl.message(
      'About us',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message(
      'Welcome!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Enter personal information in your employee account`
  String get welcometext {
    return Intl.message(
      'Enter personal information in your employee account',
      name: 'welcometext',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Or Login With `
  String get logindivider {
    return Intl.message(
      'Or Login With ',
      name: 'logindivider',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget {
    return Intl.message(
      'Forget Password ?',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Do Not Have An Account ?`
  String get pageswitchL {
    return Intl.message(
      'Do Not Have An Account ?',
      name: 'pageswitchL',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Already Have An Account ?`
  String get pageswitchS {
    return Intl.message(
      'Already Have An Account ?',
      name: 'pageswitchS',
      desc: '',
      args: [],
    );
  }

  /// `New item`
  String get newitem {
    return Intl.message(
      'New item',
      name: 'newitem',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome2 {
    return Intl.message(
      'Welcome',
      name: 'welcome2',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get itemAttach {
    return Intl.message(
      'Item',
      name: 'itemAttach',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get placeAttach {
    return Intl.message(
      'Place',
      name: 'placeAttach',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get place {
    return Intl.message(
      'Place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get itemName {
    return Intl.message(
      'Name',
      name: 'itemName',
      desc: '',
      args: [],
    );
  }

  /// `Descr`
  String get itemDes {
    return Intl.message(
      'Descr',
      name: 'itemDes',
      desc: '',
      args: [],
    );
  }

  /// `Label`
  String get label {
    return Intl.message(
      'Label',
      name: 'label',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get repeat {
    return Intl.message(
      'Repeat',
      name: 'repeat',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Enter the item name ...`
  String get itemNameH {
    return Intl.message(
      'Enter the item name ...',
      name: 'itemNameH',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Description...`
  String get itemDesH {
    return Intl.message(
      'Enter the Description...',
      name: 'itemDesH',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Place...`
  String get placeAttachH {
    return Intl.message(
      'Enter the Place...',
      name: 'placeAttachH',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Save`
  String get SaveText {
    return Intl.message(
      'Successfully Save',
      name: 'SaveText',
      desc: '',
      args: [],
    );
  }

  /// `Picture you took`
  String get Picturetook {
    return Intl.message(
      'Picture you took',
      name: 'Picturetook',
      desc: '',
      args: [],
    );
  }

  /// `Choose Colour`
  String get Choosecolour {
    return Intl.message(
      'Choose Colour',
      name: 'Choosecolour',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get Selectdate {
    return Intl.message(
      'Select Date',
      name: 'Selectdate',
      desc: '',
      args: [],
    );
  }

  /// `Update item`
  String get update {
    return Intl.message(
      'Update item',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Delete item`
  String get Deleted {
    return Intl.message(
      'Delete item',
      name: 'Deleted',
      desc: '',
      args: [],
    );
  }

  /// `Confirm deletion`
  String get DeletedilogLabel {
    return Intl.message(
      'Confirm deletion',
      name: 'DeletedilogLabel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get DeleteDilogText {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'DeleteDilogText',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Pleace fill out this field`
  String get filed {
    return Intl.message(
      'Pleace fill out this field',
      name: 'filed',
      desc: '',
      args: [],
    );
  }

  /// `successfully deleted`
  String get deleteText {
    return Intl.message(
      'successfully deleted',
      name: 'deleteText',
      desc: '',
      args: [],
    );
  }

  /// `“Coding Solutions,`
  String get aboutus1 {
    return Intl.message(
      '“Coding Solutions,',
      name: 'aboutus1',
      desc: '',
      args: [],
    );
  }

  /// `Empowering Futures”`
  String get aboutus2 {
    return Intl.message(
      'Empowering Futures”',
      name: 'aboutus2',
      desc: '',
      args: [],
    );
  }

  /// `Email copied to clipboard`
  String get aboutus3 {
    return Intl.message(
      'Email copied to clipboard',
      name: 'aboutus3',
      desc: '',
      args: [],
    );
  }

  /// `Contact us via email at`
  String get aboutus4 {
    return Intl.message(
      'Contact us via email at',
      name: 'aboutus4',
      desc: '',
      args: [],
    );
  }

  /// `“GitHub link copied to clipboard`
  String get aboutus5 {
    return Intl.message(
      '“GitHub link copied to clipboard',
      name: 'aboutus5',
      desc: '',
      args: [],
    );
  }

  /// `Our GitHub`
  String get aboutus6 {
    return Intl.message(
      'Our GitHub',
      name: 'aboutus6',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectlan {
    return Intl.message(
      'Select Language',
      name: 'selectlan',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get entername {
    return Intl.message(
      'Enter Name',
      name: 'entername',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Name..`
  String get enternameH {
    return Intl.message(
      'Enter your Name..',
      name: 'enternameH',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit`
  String get exit {
    return Intl.message(
      'Press back again to exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Check it`
  String get checkit {
    return Intl.message(
      'Check it',
      name: 'checkit',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email and then click Forgot Password`
  String get Error {
    return Intl.message(
      'Please enter your email and then click Forgot Password',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure that the email you entered is correct`
  String get Error1 {
    return Intl.message(
      'Please make sure that the email you entered is correct',
      name: 'Error1',
      desc: '',
      args: [],
    );
  }

  /// `Please click the activation link we sent to your email`
  String get INFO {
    return Intl.message(
      'Please click the activation link we sent to your email',
      name: 'INFO',
      desc: '',
      args: [],
    );
  }

  /// `A link to reset your password has been sent to your email`
  String get Success {
    return Intl.message(
      'A link to reset your password has been sent to your email',
      name: 'Success',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
