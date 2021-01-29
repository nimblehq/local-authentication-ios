//
//  HomeModule.swift
//  Example
//
//  Created by Su Van Ho on 18/1/21.
//

final class HomeModule {

  let view: HomeViewController
  let viewModel: HomeViewModel
  let router: HomeRouter

  init() {
    view = HomeViewController()
    router = HomeRouter()
    viewModel = HomeViewModel(router: router)
    view.output = viewModel
    viewModel.view = view
    router.view = view
  }
}
