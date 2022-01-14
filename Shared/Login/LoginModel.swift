//
//  LoginModel.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 25/12/21.
//

import Foundation
import Combine
import SwiftUI

class LoginModel: LoginModelProtocol {
    @Published var loginResult: LoginResult = .neutral

    @AppStorage("username") var username: String = ""
    @AppStorage("password") var password: String = ""

    // MARK: - Actions
    func loginButtonAction() {
        loginResult = .loading

        DispatchQueue.global().async { [weak self] in
            sleep(3)
            DispatchQueue.main.async {
                self?.loginResult = Bool.random() ? .success : .failure
            }
        }
    }
}
