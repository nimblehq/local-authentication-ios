//
//  BiometryError.swift
//  NimbleLocalAuthentication
//
//  Created by Su Van Ho on 15/1/21.
//

public enum BiometryError: LocalizedError, Equatable {

  case lockout
  case notEnrolled
  case notAvailable
  case failed
}
