//
//  HomeRouter.swift
//  Example
//
//  Created by Su Van Ho on 18/1/21.
//

import UIKit

protocol HomeRouterInput: AnyObject {

  func show(on window: UIWindow?)
}

final class HomeRouter {

  weak var view: HomeViewInput?

  private var viewController: UIViewController? { view as? UIViewController }

  func show(on window: UIWindow?) {
    window?.rootViewController = viewController
  }
}
