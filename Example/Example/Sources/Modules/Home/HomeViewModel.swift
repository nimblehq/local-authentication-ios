//
//  HomeViewModel.swift
//  Example
//
//  Created by Su Van Ho on 29/01/2021.
//

import NimbleLocalAuthentication

final class HomeViewModel {

  weak var view: HomeViewInput?

  private let router: HomeRouter

  private let biometryService: BiometryService

  init(
    router: HomeRouter,
    biometryService: BiometryService = NimbleLocalAuthenticator()
  ) {
    self.router = router
    self.biometryService = biometryService
  }
}

// MARK: - HomeViewOutput

extension HomeViewModel: HomeViewOutput {

  var biometricTypeName: String? {
    switch biometryService.supportedType {
    case .faceID:
      return "FaceID"
    case .touchID:
      return "TouchID"
    case .none:
      return nil
    @unknown default:
      return nil
    }
  }

  func viewDidLoad() {
    view?.configure()
    view?.setBiometricSwitchOn(biometryService.isEnabled)
  }

  func setBiometricEnabled(_ isEnabled: Bool) {
    biometryService.isEnabled = isEnabled
  }
}
