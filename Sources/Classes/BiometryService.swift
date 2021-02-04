//
//  BiometryService.swift
//  NimbleLocalAuthentication
//
//  Created by Su Van Ho on 15/1/21.
//

import LocalAuthentication

/// The protocol used to define the specifications necessary for the SDK.
public protocol BiometryService: AnyObject {

  /// A boolean value stating whether the biometric feature is enabled.
  var isEnabled: Bool { get set }

  /// A boolean value stating whether the biometric feature is available.
  var isAvailable: Bool { get }

  /// Indicates the type of the biometry supported by the device.
  var supportedType: BiometryType { get }

  /// Fallback button title.
  var localizedFallbackTitle: String? { get set }

  /// Cancel button title.
  var localizedCancelTitle: String? { get set }

  /// Allows setting the default localized authentication reason on context.
  var localizedReason: String { get set }

  /// Allows running authentication in non-interactive mode.
  var interactionNotAllowed: Bool { get set }

  /// Authenticates the user when using the application.
  ///
  /// @param completion Completeion block that is executed when authentication finishes.
  ///              success Completion parameter that is success if the authentication has been authenticate successfully.
  ///              failure Completion parameter that is failed if the authentication has been authenticate failed.
  ///                    contains error information about the authentication failure.
  ///
  /// @see BiometryError
  func authenticate(completion: @escaping (BiometryResult) -> Void)

  /// Invalidates the biometry service
  func invalidate()

  /// Credential provided by application
  ///
  /// Sets a credential to this service
  ///
  /// @param credential Credential to be used with subsequent calls. Setting this parameter to nil will remove
  ///                   any existing credential of the specified type.
  ///
  /// @param type CredentialType of the provided credential.
  ///
  /// @return YES if the credential was set successfully, NO otherwise.
  func setCredential(_ credential: Data?, type: CredentialType) -> Bool

  /// Reveals if credential was set with this context.
  ///
  /// @param type CredentialType of credential we are asking for.
  ///
  /// @return YES on success, NO otherwise.
  func isCredentialSet(_ type: CredentialType) -> Bool
}
