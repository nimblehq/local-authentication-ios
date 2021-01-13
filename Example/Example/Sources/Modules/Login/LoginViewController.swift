//
//  LoginViewController.swift
//  Example
//
//  Created by Su Van Ho on 13/1/21.
//

import UIKit

final class LoginViewController: UIViewController {

  private let backgroundImageView = UIImageView()
  private let logoImageView = UIImageView()
  private let stackView = UIStackView()
  private let emailField = UITextField()
  private let passField = UITextField()
  private let loginButton = UIButton()

  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayout()
    setUpView()
  }

  private func setUpLayout() {
    view.addSubview(backgroundImageView)
    view.addSubview(logoImageView)
    view.addSubview(stackView)
    stackView.addArrangedSubview(emailField)
    stackView.addArrangedSubview(passField)
    stackView.addArrangedSubview(loginButton)

    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  private func setUpView() {
    view.backgroundColor = .white

    backgroundImageView.image = UIImage(named: "LoginBackground")
  }
}
