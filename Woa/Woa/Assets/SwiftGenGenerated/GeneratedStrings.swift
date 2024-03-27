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
  /// Start your trip
  public static let authButton = Strings.tr("Localizable", "authButton", fallback: "Start your trip")
  /// Email
  public static let email = Strings.tr("Localizable", "email", fallback: "Email")
  /// Localizable.strings
  ///   Woa
  /// 
  ///   Created by Mac on 2024-03-22.
  public static let nick = Strings.tr("Localizable", "nick", fallback: "Nick")
  /// Password
  public static let pass = Strings.tr("Localizable", "pass", fallback: "Password")
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
