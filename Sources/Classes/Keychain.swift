//
//  Keychain.swift
//  NimbleLocalAuthentication
//
//  Created by Su Van Ho on 29/01/2021.
//

import KeychainAccess

protocol KeychainProtocol: AnyObject {

  subscript(bool key: Keychain.Key) -> Bool? { get set }
}

final class Keychain {

  enum Key: String {

    case biometricEnabled
  }

  static let shared = Keychain()

  private let keychain = KeychainAccess.Keychain(server: "https://nimblehq.co", protocolType: .https)

  private subscript(data key: Key) -> Data? {
    get { return keychain[data: key.rawValue] }
    set { keychain[data: key.rawValue] = newValue }
  }

  private func bool(from data: Data?) -> Bool? {
    guard let firstBit = data?.first else { return nil }
    return firstBit == 1
  }

  private func data(from bool: Bool?) -> Data? {
    guard let bool = bool else { return nil }
    let value: [UInt8] = bool ? [1] : [0]
    return Data(value)
  }
}

// MARK: - KeychainProtocol

extension Keychain: KeychainProtocol {

  subscript(bool key: Key) -> Bool? {
    get { return bool(from: keychain[data: key.rawValue]) }
    set { keychain[data: key.rawValue] = data(from: newValue) }
  }
}
