//
//  LoginViewModel.swift
//  CombineLearn_Login
//
//  Created by Alvin Tseng on 2023/10/22.
//

import Foundation
import Combine

struct CorrectAccount {
    static let email = "123"
    static let password = "123"
}

class LoginViewModelInput {
    var email: String = ""
    var password: String = ""
    var loginButtonEvent = PassthroughSubject<Void, Never>()
}

struct LoginViewModelOutput {
    var loginVerificationEvent = PassthroughSubject<Void, LoginVerificationError>()
}

enum LoginVerificationError: Error {
    case wrongFormat
}

class LoginViewModel {
    private var cancellables = Set<AnyCancellable>()
    var input = LoginViewModelInput()
    private var output = LoginViewModelOutput()
    
    func binding() -> LoginViewModelOutput {
        
        input.loginButtonEvent.sink { [weak self] in
            guard let self else { return }
            if verification(email: input.email, password: input.password) {
                output.loginVerificationEvent.send(completion: .finished)
            } else {
                output.loginVerificationEvent.send(completion: .failure(.wrongFormat))
            }
            
        }.store(in: &cancellables)

        return output
    }
    
    func verification(email: String, password: String) -> Bool {
        return email == CorrectAccount.email && password == CorrectAccount.password
    }
}
