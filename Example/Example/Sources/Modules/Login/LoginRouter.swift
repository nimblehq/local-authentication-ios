//
//  LoginRouter.swift
//  Example
//
//  Created by Su Van Ho on 18/1/21.
//

import UIKit

protocol LoginRouterInput: AnyObject {

  func showHome()
}

final class LoginRouter {

  weak var view: LoginViewInput?

  private var viewController: UIViewController? { view as? UIViewController }

  func showHome() {
    let module = HomeModule()
    module.router.show(on: viewController?.view.window)
  }
}
