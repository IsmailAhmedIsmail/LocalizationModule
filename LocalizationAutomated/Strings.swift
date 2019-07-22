// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Hello
  internal static var hello: String { return L10n.tr("Localizable", "Hello") }
  /// Title
  internal static var ourTitle: String { return L10n.tr("Localizable", "OurTitle") }

  internal enum Ragab {
    /// ragab
    internal static var ragaboolean: String { return L10n.tr("Localizable", "Ragab.ragaboolean") }
  }

  internal enum Images {
    /// warning
    internal static var warning: String { return L10n.tr("Localizable", "images.warning") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
