//
//  HomeModule.swift
//  Example
//
//  Created by Su Van Ho on 18/1/21.
//

final class HomeModule {

  let view: HomeViewController
  let router: HomeRouter

  init() {
    view = HomeViewController()
    router = HomeRouter()
    router.view = view
  }
}
