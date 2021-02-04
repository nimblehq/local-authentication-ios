//
//  HomeViewController.swift
//  Example
//
//  Created by Su Van Ho on 18/1/21.
//

import UIKit

protocol HomeViewInput: AnyObject {

  func configure()
  func setBiometricSwitchOn(_ isOn: Bool)
}

protocol HomeViewOutput: AnyObject {

  var biometricTypeName: String? { get }

  func viewDidLoad()
  func setBiometricEnabled(_ isEnabled: Bool)
}

final class HomeViewController: UIViewController {

  let backgroundImageView = UIImageView()
  let biometricLabel = UILabel()
  let biometricSwitch = UISwitch()

  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  var output: HomeViewOutput?

  override func viewDidLoad() {
    super.viewDidLoad()
    output?.viewDidLoad()
  }

  private func setUpLayouts() {
    view.addSubview(backgroundImageView)
    view.addSubview(biometricLabel)
    view.addSubview(biometricSwitch)

    [
      backgroundImageView,
      biometricLabel,
      biometricSwitch
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
      biometricLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      biometricLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])

    NSLayoutConstraint.activate([
      biometricSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      biometricSwitch.topAnchor.constraint(equalTo: biometricLabel.bottomAnchor, constant: 16.0)
    ])
  }

  private func setUpViews() {
    view.backgroundColor = .white
    backgroundImageView.image = UIImage(named: "Home")

    biometricLabel.textColor = .white
    biometricLabel.text = output?.biometricTypeName

    biometricSwitch.addTarget(self, action: #selector(biometricSwitchValueDidChange), for: .valueChanged)
  }

  @objc private func biometricSwitchValueDidChange(_ biometricSwitch: UISwitch) {
    output?.setBiometricEnabled(biometricSwitch.isOn)
  }
}

extension HomeViewController: HomeViewInput {

  func configure() {
    setUpLayouts()
    setUpViews()
  }

  func setBiometricSwitchOn(_ isOn: Bool) {
    biometricSwitch.setOn(isOn, animated: true)
  }
}
