//
//  LoginMocks.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 14/01/22.
//

import Foundation

struct LoginMocks {
    static let defaultMock: LoginModel = {
        LoginModel()
    }()

    static let wrongPasswordMock: LoginModel = {
        let ans = LoginModel()

        ans.username = "user"
        ans.password = "wrongPass"
        ans.loginResult = .failure

        return ans
    }()
}
