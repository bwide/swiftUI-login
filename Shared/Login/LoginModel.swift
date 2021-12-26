//
//  LoginModel.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 25/12/21.
//

import Foundation
import Combine
import SwiftUI

class LoginModel: ObservableObject {

    @AppStorage("username") var username: String = ""
    @State var usernamePrompt: String = ""

    @AppStorage("password") var password: String = ""
    @State var passwordPrompt: String = ""

    var loginButtonTitle: String = "Login"

    struct Static {
        static var usernameTitle = "Username"
        static var passwordTitle = "Password"
    }

    // MARK: - Actions
    func loginButtonAction() -> Void {
        print("login")
        print(username)
        print(password)
    }

    init() {

    }

}
