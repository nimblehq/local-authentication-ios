<p align="center">
  <img alt="Nimble logo" src="https://assets.nimblehq.co/logo/light/logo-light-text-320.png" />
</p>

---

# NimbleLocalAuthentication 1.0.0

![Tests](https://github.com/nimblehq/local-authentication-ios/workflows/Tests/badge.svg?branch=develop)

The basic idea of NimbleLocalAuthentication is that we want to wrap the LocalAuthentication framework. Developer can easily authenticate users biometrically or with a passphrase.

Some awesome features of NimbleLocalAuthentication:

- Support enable or disable the biometric feature on the application.
- Easy to localized strings on biometric screens.

You can check out more about the SDK in the document [WIP]

## Sample projects

We have a sample project in the repository. To use it, download the repo, run `pod install` in Example folder to download the required libraries and open [Example.xcworkspace](https://github.com/nimblehq/local-authentication-ios/tree/main/Example/Example.xcworkspace).

## Installation

For `NimbleLocalAuthentication`, use the following entry in your Podfile:

```rb
pod 'NimbleLocalAuthentication', '~> 1.0'
```

Then run `pod install`

## Usage

Using `NimbleLocalAuthentication` is really simple. You can access an API like this:

```swift
let biometryService: BiometryService = NimbleLocalAuthenticatior()

biometryService.authenticate { [weak self] result in
  DispatchQueue.main.async {
    switch result {
    case .success:
      // do something after authenticate successfully
    case .failure(let error):
      // hackers are trying to authenticate :D
    }
  }
}
```

## License

This project is Copyright (c) 2014-2021 Nimble. It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE

## About

![Nimble](https://assets.nimblehq.co/logo/dark/logo-dark-text-160.png)

This project is maintained and funded by Nimble.

We love open source and do our part in sharing our work with the community!
See [our other projects][community] or [hire our team][hire] to help build your product.

[community]: https://github.com/nimblehq
[hire]: https://nimblehq.co/
