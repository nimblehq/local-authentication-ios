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

  private let router: LoginRouter

  private let biometryService: BiometryService

  init(
    router: LoginRouter,
    biometryService: BiometryService = NimbleLocalAuthenticatior()
  ) {
    self.router = router
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
      return "ic-pass"
    @unknown default:
      return "ic-pass"
    }
  }

  func viewDidLoad() {
    view?.configure()
  }

  func selectBiometric() {
    biometryService.authenticate { [weak self] result in
      switch result {
      case .success:
        self?.router.showHome()
      case .failure(let error):
        self?.view?.showMessage(error.localizedDescription)
      }
    }
  }
}

// MARK: - LoginInput

extension LoginViewModel: LoginInput {}
