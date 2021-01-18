//
//  HomeViewController.swift
//  Example
//
//  Created by Su Van Ho on 18/1/21.
//

import UIKit

protocol HomeViewInput: AnyObject {}

final class HomeViewController: UIViewController {

  let backgroundImageView = UIImageView()

  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayouts()
    setUpViews()
  }

  private func setUpLayouts() {
    view.addSubview(backgroundImageView)
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  private func setUpViews() {
    view.backgroundColor = .white
    backgroundImageView.image = UIImage(named: "Home")
  }
}

extension HomeViewController: HomeViewInput {}
