//
//  LoginModule.swift
//  Example
//
//  Created by Su Van Ho on 15/1/21.
//

import Foundation

protocol LoginInput: AnyObject {}

protocol LoginOutput: AnyObject {}

final class LoginModule {

  let view: LoginViewController
  let viewModel: LoginViewModel

  var output: LoginOutput? {
    get { viewModel.output }
    set { viewModel.output = newValue }
  }

  var input: LoginInput {
    viewModel
  }

  init() {
    view = LoginViewController()
    viewModel = LoginViewModel()
    view.output = viewModel
    viewModel.view = view
  }
}
