// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  public enum Alert {
    /// Ok
    public static let ok = Strings.tr("Localizable", "alert.ok", fallback: "Ok")
  }
  public enum Button {
    /// Already regregistered?
    public static let alreadyReg = Strings.tr("Localizable", "button.alreadyReg", fallback: "Already regregistered?")
    /// Start your trip
    public static let auth = Strings.tr("Localizable", "button.auth", fallback: "Start your trip")
  }
  public enum Error {
    ///  can't contain special characters
    public static let cantHasSpecial = Strings.tr("Localizable", "error.cantHasSpecial", fallback: " can't contain special characters")
    ///  can't be empty
    public static let emptyData = Strings.tr("Localizable", "error.emptyData", fallback: " can't be empty")
    /// Incorrect 
    public static let incorrect = Strings.tr("Localizable", "error.incorrect", fallback: "Incorrect ")
    ///  length has to be 
    public static let length = Strings.tr("Localizable", "error.length", fallback: " length has to be ")
    ///  must contain capital letters
    public static let needCapital = Strings.tr("Localizable", "error.needCapital", fallback: " must contain capital letters")
    ///  must contain numbers
    public static let needNumbers = Strings.tr("Localizable", "error.needNumbers", fallback: " must contain numbers")
    ///  must contain special characters
    public static let needSpecial = Strings.tr("Localizable", "error.needSpecial", fallback: " must contain special characters")
    ///  must contain only Arabic letters
    public static let onlyArabic = Strings.tr("Localizable", "error.onlyArabic", fallback: " must contain only Arabic letters")
    public enum Alert {
      /// System error, please try again
      public static let signup = Strings.tr("Localizable", "error.alert.signup", fallback: "System error, please try again")
    }
  }
  public enum Firebase {
    public enum Folder {
      /// avatars
      public static let avatars = Strings.tr("Localizable", "firebase.folder.avatars", fallback: "avatars")
      /// users
      public static let db = Strings.tr("Localizable", "firebase.folder.db", fallback: "users")
    }
  }
  public enum Set {
    /// ABCDEFGHIJKLMNOPQRSTUVWXYZ
    public static let capital = Strings.tr("Localizable", "set.capital", fallback: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    /// ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$
    public static let email = Strings.tr("Localizable", "set.email", fallback: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$")
    /// 0123456789
    public static let numbers = Strings.tr("Localizable", "set.numbers", fallback: "0123456789")
    /// !@#$%^&*()-_=+[{]}|;:'",.<>?`~
    public static let special = Strings.tr("Localizable", "set.special", fallback: "!@#$%^&*()-_=+[{]}|;:'\",.<>?`~")
  }
  public enum Title {
    /// Age
    public static let age = Strings.tr("Localizable", "title.age", fallback: "Age")
    /// Email
    public static let email = Strings.tr("Localizable", "title.email", fallback: "Email")
    /// IconId
    public static let icon = Strings.tr("Localizable", "title.icon", fallback: "IconId")
    /// Localizable.strings
    ///   Woa
    /// 
    ///   Created by Mac on 2024-03-22.
    public static let nick = Strings.tr("Localizable", "title.nick", fallback: "Nick")
    /// Password
    public static let pass = Strings.tr("Localizable", "title.pass", fallback: "Password")
  }
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
