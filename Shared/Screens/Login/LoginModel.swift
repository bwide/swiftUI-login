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

    private let service: LoginServiceProtocol

    init(service: LoginServiceProtocol = LoginServiceMock()) {
        self.service = service
    }

    // MARK: - Actions

    func loginButtonAction() {
        loginResult = .loading
        service.login(username, password) { [weak self] success in
            self?.loginResult = success ? .success : .failure
            if success {
                self?.navigationRoute = .home
            }
        }
    }

    // MARK: - Routing
    typealias Route = AppRoute

    @Published var navigationRoute: AppRoute?
    var navigationRoutePublished: Published<AppRoute?>.Publisher { $navigationRoute }
}
