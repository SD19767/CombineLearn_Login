//
//  File.swift
//  CombineLearn_Login
//
//  Created by Alvin Tseng on 2023/10/22.
//

import UIKit
import Combine
extension UITextField {
  func textPublisher() -> AnyPublisher<String, Never> {
      NotificationCenter.default
          .publisher(for: UITextField.textDidChangeNotification, object: self)
          .map { ($0.object as? UITextField)?.text  ?? "" }
          .eraseToAnyPublisher()
  }
}
