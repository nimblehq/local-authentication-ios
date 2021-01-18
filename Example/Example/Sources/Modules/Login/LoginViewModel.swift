//
//  LoginViewModel.swift
//  Example
//
//  Created by Su Van Ho on 15/1/21.
//

import NimbleLocalAuthentication

final class LoginViewModel {

  weak var view: LoginViewInput?
  weak var output: LoginOutput?

  private let biometryService: BiometryService

  init(biometryService: BiometryService = NimbleLocalAuthenticatior()) {
    self.biometryService = biometryService
  }
}

// MARK: - LoginViewOuput

extension LoginViewModel: LoginViewOuput {

  var isBiometricAvailable: Bool {
    biometryService.isAvailable
  }

  var biometricImageName: String {
    switch biometryService.supportedType {
    case .faceID:
      return "ic-face-id"
    case .touchID:
      return "ic-touch-id"
    case .none:
      return ""
    @unknown default:
      return ""
    }
  }

  func viewDidLoad() {
    view?.configure()
  }

  func selectBiometric() {
    biometryService.authenticate { result in
      switch result {
      case .success:
        print("Success")
      case .failure:
        print("Failure")
      }
    }
  }
}

// MARK: - LoginInput

extension LoginViewModel: LoginInput {}
