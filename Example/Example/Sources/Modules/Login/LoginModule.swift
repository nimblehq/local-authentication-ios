//
//  LoginModule.swift
//  Example
//
//  Created by Su Van Ho on 15/1/21.
//

final class LoginModule {

  let view: LoginViewController
  let viewModel: LoginViewModel
  let router: LoginRouter

  init() {
    view = LoginViewController()
    router = LoginRouter()
    viewModel = LoginViewModel(router: router)
    view.output = viewModel
    viewModel.view = view
    router.view = view
  }
}
