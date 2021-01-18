//
//  TextField.swift
//  Example
//
//  Created by Su Van Ho on 14/1/21.
//

import UIKit

final class TextField: UITextField {

  let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

  var placeholderText: String = "" {
    didSet {
      attributedPlaceholder = NSAttributedString(
        string: placeholderText,
        attributes: [
          .foregroundColor: UIColor.white.withAlphaComponent(0.3)
        ]
      )
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.white.withAlphaComponent(0.18)
    layer.cornerRadius = 12.0
    clipsToBounds = true
    textColor = .white
    tintColor = .white
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func textRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }

  override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }

  override public func editingRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }
}

