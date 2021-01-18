//
//  BiometryService.swift
//  NimbleLocalAuthentication
//
//  Created by Su Van Ho on 15/1/21.
//

import LocalAuthentication

public protocol BiometryService {

  var isAvailable: Bool { get }
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


