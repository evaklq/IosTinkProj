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
    /// Buy
    public static let buy = Strings.tr("Localizable", "button.buy", fallback: "Buy")
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
    /// ArtObject
    public static let artObject = Strings.tr("Localizable", "title.artObject", fallback: "ArtObject")
    /// ₽ 
    public static let cost = Strings.tr("Localizable", "title.cost", fallback: "₽ ")
    /// Email
    public static let email = Strings.tr("Localizable", "title.email", fallback: "Email")
    /// Graphics
    public static let graphics = Strings.tr("Localizable", "title.graphics", fallback: "Graphics")
    /// IconId
    public static let icon = Strings.tr("Localizable", "title.icon", fallback: "IconId")
    /// Find your favorite art
    public static let mainFindTextField = Strings.tr("Localizable", "title.mainFindTextField", fallback: "Find your favorite art")
    /// Localizable.strings
    ///   Woa
    /// 
    ///   Created by Mac on 2024-03-22.
    public static let nick = Strings.tr("Localizable", "title.nick", fallback: "Nick")
    /// Password
    public static let pass = Strings.tr("Localizable", "title.pass", fallback: "Password")
    /// Photo
    public static let photo = Strings.tr("Localizable", "title.photo", fallback: "Photo")
    /// Picture
    public static let picture = Strings.tr("Localizable", "title.picture", fallback: "Picture")
    /// Popular art objects for sale
    public static let popularArtObjects = Strings.tr("Localizable", "title.popularArtObjects", fallback: "Popular art objects for sale")
    /// Popular arts
    public static let popularArts = Strings.tr("Localizable", "title.popularArts", fallback: "Popular arts")
    /// Popular graphics for sale
    public static let popularGraphics = Strings.tr("Localizable", "title.popularGraphics", fallback: "Popular graphics for sale")
    /// Popular photos for sale
    public static let popularPhotos = Strings.tr("Localizable", "title.popularPhotos", fallback: "Popular photos for sale")
    /// Popular pictures for sale
    public static let popularPicteres = Strings.tr("Localizable", "title.popularPicteres", fallback: "Popular pictures for sale")
    /// Popular sculptures for sale
    public static let popularSculptures = Strings.tr("Localizable", "title.popularSculptures", fallback: "Popular sculptures for sale")
    /// Sculpture
    public static let sculpture = Strings.tr("Localizable", "title.sculpture", fallback: "Sculpture")
    /// Your shopping cart
    public static let shoppingCart = Strings.tr("Localizable", "title.shoppingCart", fallback: "Your shopping cart")
    /// Welcome, Evaklq
    public static let welcomeUser = Strings.tr("Localizable", "title.welcomeUser", fallback: "Welcome, Evaklq")
    ///  year
    public static let year = Strings.tr("Localizable", "title.year", fallback: " year")
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
