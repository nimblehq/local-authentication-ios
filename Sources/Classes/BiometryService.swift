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

  /// A enum value stating
  var supportedType: BiometryType { get }
  var localizedFallbackTitle: String? { get set }
  var localizedCancelTitle: String? { get set }
  var localizedReason: String { get set }
  var interactionNotAllowed: Bool { get set }

  func authenticate(completion: @escaping (BiometryResult) -> Void)
  func invalidate()
  func setCredential(_ credential: Data?, type: CredentialType) -> Bool
  func isCredentialSet(_ type: CredentialType) -> Bool
}
