//
//  LoginService.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 01/02/22.
//

import Foundation
import SwiftUI

class LoginServiceMock: LoginServiceProtocol {
    func login(_ email: String, _ password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            completion(password=="123")
        }
    }
}
