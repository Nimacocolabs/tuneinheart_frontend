import 'package:flutter/services.dart';

class FormatAndValidate {
  static final RegExp _alphaRegExp = RegExp('[a-zA-Z]');
  static final RegExp _numericRegExp = RegExp('[0-9]');
  static final RegExp _alphanumericRegExp = new RegExp(r'^[a-zA-Z0-9]+$');
  static final RegExp _drivingLicenceRegExp = RegExp(
      '^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}');
  static final RegExp emailRegExp = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
  static final RegExp _addressRegExp = RegExp(r'^[a-zA-Z0-9\.\-\s\,\/]+$');
  static final RegExp _dobRegExp =
  RegExp('^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])');

  formatName() {
    return [FilteringTextInputFormatter.allow(_alphaRegExp)];
  }
  formatNumber() {
    return [FilteringTextInputFormatter.allow(_numericRegExp)];
  }

  formatPhone() {
    return [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.digitsOnly
    ];
  }

  formatyear() {
    return [
      LengthLimitingTextInputFormatter(4),
      FilteringTextInputFormatter.digitsOnly
    ];
  }

  formatEmail() {
    return [FilteringTextInputFormatter.allow(emailRegExp)];
  }

  formatDateOfBirth() {
    return [LengthLimitingTextInputFormatter(10)];
  }

  formatAadhaar() {
    return [
      LengthLimitingTextInputFormatter(12),
      FilteringTextInputFormatter.digitsOnly
    ];
  }

  formatPANCard() {
    return [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.allow(_alphanumericRegExp)
    ];
  }

  formatPassport() {
    return [
      LengthLimitingTextInputFormatter(8),
      FilteringTextInputFormatter.allow(_alphanumericRegExp)
    ];
  }

  formatDrivingLicence() {
    return [
      LengthLimitingTextInputFormatter(16),
      // FilteringTextInputFormatter.allow(_drivingLicenceRegExp)
    ];
  }

  formatAddress() {
    FilteringTextInputFormatter.allow(_addressRegExp);
  }

  formatPinCode() {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(6)
    ];
  }
  validateNumber(value) {
    return value!.isEmpty || value.length > 8 ||
        value.length < 4
        ? "Enter valid"
        : null;
  }
  validatePinCode(value) {
    return value!.isEmpty || value.length != 6
        ? "Enter 6 digit pin code"
        : null;
  }

  validateAddress(value) {
    return value!.isEmpty || !_addressRegExp.hasMatch(value)
        ? "Enter valid Address"
        : null;
  }

  validateName(value) {
    return value!.isEmpty || !_alphaRegExp.hasMatch(value)
        ? "Enter valid name"
        : null;
  }

  validateSong(value) {
    return value!.isEmpty || !_alphaRegExp.hasMatch(value)
        ? "Please enter song name"
        : null;
  }

  validateDob(value) {
    return value!.isEmpty ||
        value.length > 10 ||
        value.length < 8 ||
        _dobRegExp.hasMatch(value)
        ? "Enter Date in format YYYY/MM/DD"
        : null;
  }
  validateYear(value) {
    return value.isEmpty || value.length != 4
        ? "Enter valid year"
        : null;
  }

  validateAadhaar(value) {
    return value!.isEmpty ||
        value.length != 12 ||
        !_numericRegExp.hasMatch(value) ||
        _alphaRegExp.hasMatch(value)
        ? "Enter valid 12 digit Adhaar number"
        : null;
  }

  validatePANCard(value) {
    return value!.isEmpty ||
        value.length != 10 ||
        !_alphaRegExp.hasMatch(value.substring(0,
            2)) //First three characters i.e. "XYZ" in the above PAN are alphabetic series running from AAA to ZZZ
        ||
        !_alphaRegExp.hasMatch(value.substring(
            3)) //Fourth character i.e. "P" stands for Individual status of applicant.
        ||
        !_alphaRegExp.hasMatch(value.substring(
            4)) //Fifth character i.e. "K" in the above PAN represents first character of the PAN holder's last name/surname.
        ||
        !_numericRegExp.hasMatch(value.substring(5,
            8)) //Next four characters i.e. "8200" in the above PAN are sequential number running from 0001 to 9999.
        ||
        !_alphaRegExp.hasMatch(value.substring(
            9)) //Last character i.e. "S" in the above PAN is an alphabetic check digit.
        ? "Enter 10 digit valid PAN Card number"
        : null;
  }

  validatePassport(value) {
    return value!.isEmpty ||
        value.length != 8 ||
        !(_alphaRegExp.hasMatch(value[0])) ||
        !(_numericRegExp.hasMatch(value.substring(1, 8)))
        ? "Enter 8 digit valid Passport ID"
        : null;
  }

  validateDrivingLicence(value) {
    return value.isEmpty ||
        value.length != 16 ||
        !(_drivingLicenceRegExp.hasMatch(value))
        ? "Enter 16 digit valid Driving licence number"
        : null;
  }

  validateVotersID(value) {
    return value.isEmpty ? "Enter valid voter's ID" : null;
  }

  validateEmailID(value) {
    return value!.isEmpty || !emailRegExp.hasMatch(value)
        ? "Enter valid email address"
        : null;
  }

  validatePhoneNo(value) {
    return value.isEmpty || value.length != 10
        ? "Enter 10 digit mobile number"
        : null;
  }
}
