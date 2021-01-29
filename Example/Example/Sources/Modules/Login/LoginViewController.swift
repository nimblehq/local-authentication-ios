//
//  LoginViewController.swift
//  Example
//
//  Created by Su Van Ho on 13/1/21.
//

import UIKit

protocol LoginViewInput: AnyObject {

  func configure()
  func showMessage(_ message: String)
  func setBiometricButtonHidden(_ isHidden: Bool)
}

protocol LoginViewOuput: AnyObject {

  var isBiometricAvailable: Bool { get }
  var biometricImageName: String { get }

  func viewDidLoad()
  func selectBiometric()
  func logIn()
}

final class LoginViewController: UIViewController {

  private let backgroundImageView = UIImageView()
  private let logoImageView = UIImageView()
  private let stackView = UIStackView()
  private let emailField = TextField()
  private let passField = TextField()
  private let loginButton = UIButton()
  private let biometricButton = UIButton()

  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  var output: LoginViewOuput?

  override func viewDidLoad() {
    super.viewDidLoad()
    output?.viewDidLoad()
  }
}

// MARK: - LoginViewInput

extension LoginViewController: LoginViewInput {

  func configure() {
    setUpLayouts()
    setUpViews()
  }

  func showMessage(_ message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }

  func setBiometricButtonHidden(_ isHidden: Bool) {
    biometricButton.isHidden = isHidden
  }

  private func setUpLayouts() {
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
      emailField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -Constant.padding).priority(.required - 1.0)
    ])

    NSLayoutConstraint.activate([
      passField.heightAnchor.constraint(equalToConstant: Constant.fieldHeight),
      passField.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -Constant.padding).priority(.required - 1.0)
    ])

    NSLayoutConstraint.activate([
      loginButton.heightAnchor.constraint(equalToConstant: Constant.fieldHeight),
      loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -Constant.padding).priority(.required - 1.0)
    ])

    NSLayoutConstraint.activate([
      biometricButton.heightAnchor.constraint(equalToConstant: Constant.buttonSize.height),
      biometricButton.widthAnchor.constraint(equalToConstant: Constant.buttonSize.width)
    ])
  }

  private func setUpViews() {
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
    loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)

    if let output = output {
      let biometricImageName = output.biometricImageName
      let biometricImage = UIImage(named: biometricImageName)?.withRenderingMode(.alwaysTemplate)
      biometricButton.setImage(biometricImage, for: .normal)
      biometricButton.tintColor = .white
      biometricButton.isHidden = !output.isBiometricAvailable
    }

    biometricButton.addTarget(self, action: #selector(biometricButtonDidTap), for: .touchUpInside)
  }

  @objc private func biometricButtonDidTap(_ sender: UIButton) {
    output?.selectBiometric()
  }

  @objc private func loginButtonDidTap(_ sender: UIButton) {
    output?.logIn()
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

extension NSLayoutConstraint {

  func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
    self.priority = priority
    return self
  }
}
