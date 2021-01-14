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
  private let emailField = TextField()
  private let passField = TextField()
  private let loginButton = UIButton()
  private let biometricButton = UIButton()

  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayout()
    setUpView()
  }
}

// MARK: - Setup

extension LoginViewController {

  private func setUpLayout() {
    view.addSubview(backgroundImageView)
    view.addSubview(logoImageView)
    view.addSubview(stackView)
    stackView.addArrangedSubview(emailField)
    stackView.addArrangedSubview(passField)
    stackView.addArrangedSubview(biometricButton)
    stackView.addArrangedSubview(loginButton)

    [
      backgroundImageView,
      logoImageView,
      stackView,
      emailField,
      passField,
      loginButton,
      biometricButton
    ].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }

    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150.0),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])

    stackView.spacing = 20.0
    stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: Constant.padding, bottom: 0.0, right: Constant.padding)
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    NSLayoutConstraint.activate([
      emailField.heightAnchor.constraint(equalToConstant: Constant.fieldHeight),
      emailField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -Constant.padding)
    ])

    NSLayoutConstraint.activate([
      passField.heightAnchor.constraint(equalToConstant: Constant.fieldHeight),
      passField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -Constant.padding)
    ])

    NSLayoutConstraint.activate([
      loginButton.heightAnchor.constraint(equalToConstant: Constant.fieldHeight),
      loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -Constant.padding)
    ])

    NSLayoutConstraint.activate([
      biometricButton.heightAnchor.constraint(equalToConstant: Constant.buttonSize.height),
      biometricButton.widthAnchor.constraint(equalToConstant: Constant.buttonSize.width)
    ])
  }

  private func setUpView() {
    view.backgroundColor = .white

    backgroundImageView.image = UIImage(named: "LoginBackground")
    logoImageView.image = UIImage(named: "WhiteLogo")
    stackView.alignment = .center
    stackView.axis = .vertical
    stackView.isLayoutMarginsRelativeArrangement = true

    emailField.placeholderText = "Email"
    passField.placeholderText = "Password"

    loginButton.setTitle("Login", for: .normal)
    loginButton.backgroundColor = .white
    loginButton.setTitleColor(.black, for: .normal)
    loginButton.layer.cornerRadius = 12.0
    loginButton.clipsToBounds = true

    biometricButton.setImage(UIImage(named: "ic-face-id")?.withRenderingMode(.alwaysTemplate), for: .normal)
    biometricButton.tintColor = .white
  }
}

// MARK: - Constant

extension LoginViewController {

  enum Constant {

    static let padding: CGFloat = 24.0
    static let fieldHeight: CGFloat = 56.0
    static let buttonSize: CGSize = .init(width: 44.0, height: 44.0)
  }
}
