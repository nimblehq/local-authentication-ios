//
//  LoginModule.swift
//  Example
//
//  Created by Su Van Ho on 15/1/21.
//

protocol LoginInput: AnyObject {}

protocol LoginOutput: AnyObject {}

final class LoginModule {

  let view: LoginViewController
  let viewModel: LoginViewModel
  let router: LoginRouter

  var output: LoginOutput? {
    get { viewModel.output }
    set { viewModel.output = newValue }
  }

  var input: LoginInput {
    viewModel
  }

  init() {
    view = LoginViewController()
    router = LoginRouter()
    viewModel = LoginViewModel(router: router)
    view.output = viewModel
    viewModel.view = view
    router.view = view
  }
}
