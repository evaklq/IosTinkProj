// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  /// Age
  public static let age = Strings.tr("Localizable", "age", fallback: "Age")
  /// Already regregistered?
  public static let alreadyRegButton = Strings.tr("Localizable", "alreadyRegButton", fallback: "Already regregistered?")
  ///  must contain only Arabic letters
  public static let arabic = Strings.tr("Localizable", "arabic", fallback: " must contain only Arabic letters")
  /// abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
  public static let arabicAndNumbersSet = Strings.tr("Localizable", "arabicAndNumbersSet", fallback: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
  /// Start your trip
  public static let authButton = Strings.tr("Localizable", "authButton", fallback: "Start your trip")
  /// avatars
  public static let avatars = Strings.tr("Localizable", "avatars", fallback: "avatars")
  ///  must contain capital letters
  public static let capital = Strings.tr("Localizable", "capital", fallback: " must contain capital letters")
  /// ABCDEFGHIJKLMNOPQRSTUVWXYZ
  public static let capitalSet = Strings.tr("Localizable", "capitalSet", fallback: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  /// users
  public static let db = Strings.tr("Localizable", "db", fallback: "users")
  /// Email
  public static let email = Strings.tr("Localizable", "email", fallback: "Email")
  /// ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$
  public static let emailReg = Strings.tr("Localizable", "emailReg", fallback: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$")
  ///  can't be empty
  public static let emptyData = Strings.tr("Localizable", "emptyData", fallback: " can't be empty")
  /// IconId
  public static let icon = Strings.tr("Localizable", "icon", fallback: "IconId")
  /// Incorrect 
  public static let incorrect = Strings.tr("Localizable", "incorrect", fallback: "Incorrect ")
  ///  lenth has to be 
  public static let lenth = Strings.tr("Localizable", "lenth", fallback: " lenth has to be ")
  /// Localizable.strings
  ///   Woa
  /// 
  ///   Created by Mac on 2024-03-22.
  public static let nick = Strings.tr("Localizable", "nick", fallback: "Nick")
  ///  can't contain special characters
  public static let notSpecial = Strings.tr("Localizable", "notSpecial", fallback: " can't contain special characters")
  ///  must contain numbers
  public static let numbers = Strings.tr("Localizable", "numbers", fallback: " must contain numbers")
  /// 0123456789
  public static let numbersSet = Strings.tr("Localizable", "numbersSet", fallback: "0123456789")
  /// Password
  public static let pass = Strings.tr("Localizable", "pass", fallback: "Password")
  ///  must contain special characters
  public static let special = Strings.tr("Localizable", "special", fallback: " must contain special characters")
  /// !@#$%^&*()-_=+[{]}|;:'",.<>?`~
  public static let specialSet = Strings.tr("Localizable", "specialSet", fallback: "!@#$%^&*()-_=+[{]}|;:'\",.<>?`~")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
