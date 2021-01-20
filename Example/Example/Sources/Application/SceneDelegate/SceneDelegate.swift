//
//  SceneDelegate.swift
//  Example
//
//  Created by Su Van Ho on 13/1/21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    window?.rootViewController = LoginModule().view
    window?.makeKeyAndVisible()
  }
}
