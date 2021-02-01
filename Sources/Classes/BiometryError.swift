//
//  BiometryError.swift
//  NimbleLocalAuthentication
//
//  Created by Su Van Ho on 15/1/21.
//

/// A type representing possible errors NimbleLocalAuthentication can throw.
public enum BiometryError: LocalizedError, Equatable {

  /// Authentication was not successful because there were too many failed biometry attempts and
  /// biometry is now locked. Passcode is required to unlock biometry, e.g. evaluating
  case lockout

  /// Authentication could not start because biometry has no enrolled identities.
  case notEnrolled

  /// Authentication could not start because biometry is not available on the device.
  case notAvailable

  /// Authentication could not start because other reasons.
  case failed
}
