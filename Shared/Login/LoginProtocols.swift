//
//  LoginProtocols.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 14/01/22.
//

import Foundation
import SwiftUI

protocol LoginModelProtocol: ObservableObject {
    var loginResult: LoginResult { get }

    var usernameTitle: String { get }
    var passwordTitle: String { get }

    var username: String { get set }
    var password: String { get set }

    var loginButtonTitle: String { get }

    func loginButtonAction()
}

extension LoginModelProtocol {
    var usernameTitle: String { "Username" }
    var passwordTitle: String { "Password" }

    var loginButtonTitle: String {
        switch loginResult {
        case .neutral: return "Login"
        case .success: return "Success"
        case .failure: return "Failure"
        case .loading: return ""
        }
    }
}

enum LoginErrorPrompt: String {
    case invalidPassword = "this password in invalid"
    case invalidUsername = "this username is invalid"
}

enum LoginResult {
    case success, failure, loading, neutral
}
