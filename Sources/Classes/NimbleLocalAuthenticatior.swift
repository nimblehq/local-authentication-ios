//
//  NimbleLocalAuthenticatior.swift
//  NimbleLocalAuthentication
//
//  Created by Su Van Ho on 15/1/21.
//

import LocalAuthentication

public final class NimbleLocalAuthenticatior {

  private let context: LAContext = LAContext()
  private let policy: LAPolicy = .deviceOwnerAuthentication
  private let keychain: KeychainProtocol = Keychain.shared

  public init() {
    context.canEvaluatePolicy(policy, error: nil)
  }
}

// MARK: - BiometryService

extension NimbleLocalAuthenticatior: BiometryService {

  public var isEnabled: Bool {
    get { return keychain[bool: .biometricEnabled] ?? false }
    set { keychain[bool: .biometricEnabled] = newValue }
  }

  public var isAvailable: Bool {
    context.canEvaluatePolicy(policy, error: .none)
  }

  public var supportedType: BiometryType {
    context.biometryType
  }

  public var localizedFallbackTitle: String? {
    get {
      context.localizedFallbackTitle
    }
    set {
      context.localizedFallbackTitle = newValue
    }
  }

  public var localizedCancelTitle: String? {
    get {
      context.localizedCancelTitle
    }
    set {
      context.localizedCancelTitle = newValue
    }
  }

  public var localizedReason: String {
    get {
      context.localizedReason
    }
    set {
      context.localizedReason = newValue
    }
  }

  public var interactionNotAllowed: Bool {
    get {
      context.interactionNotAllowed
    }
    set {
      context.interactionNotAllowed = newValue
    }
  }

  public func authenticate(completion: @escaping (BiometryResult) -> Void) {
    context.evaluatePolicy(
      policy,
      localizedReason: "Unlock the app with biometry authentication"
    ) { [weak self] (isSuccess, error) in
      self?.handleEvaluation(isSuccess: isSuccess, error: error, completion: completion)
    }
  }

  public func invalidate() {
    context.invalidate()
  }

  public func setCredential(_ credential: Data?, type: CredentialType) -> Bool {
    context.setCredential(credential, type: type)
  }

  public func isCredentialSet(_ type: CredentialType) -> Bool {
    context.isCredentialSet(type)
  }
}

// MARK: - Private

extension NimbleLocalAuthenticatior {

  private func handleEvaluation(
    isSuccess: Bool,
    error: Error?,
    completion: @escaping (BiometryResult) -> Void
  ) {
    if isSuccess {
      completion(.success(()))
    } else if let error = error {
      completion(.failure(biometryError(from: error)))
    } else {
      completion(.failure(.failed))
    }
  }

  private func biometryError(from error: Error) -> BiometryError {
    switch error {
    case LAError.biometryLockout:
      return .lockout
    case LAError.biometryNotEnrolled:
      return .notEnrolled
    case LAError.biometryNotAvailable:
      return .notAvailable
    default:
      return .failed
    }
  }
}
