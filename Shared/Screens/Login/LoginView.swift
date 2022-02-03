//
//  LoginView.swift
//  Shared
//
//  Created by Bruno Wide on 25/12/21.
//

import SwiftUI
import Combine

struct LoginView<VM: LoginModelProtocol, Route: Routing>: AppView {

    typealias VM = LoginModel
    typealias Router = AppRouter

    @EnvironmentObject var viewModel: LoginModel
    var viewModelEnvironmentObject: EnvironmentObject<LoginModel>.Wrapper { $viewModel }
    var router: AppRouter


    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 48) {
                usernameField
                passwordField
                loginButton
                navigationLinks
            }
            .padding(24)
        }
        .environmentObject(HomeInput(username: viewModel.username))
    }

    var usernameField: some View {
        TextField(viewModel.usernameTitle, text: $viewModel.username)
    }

    var passwordField: some View {
        TextField(viewModel.passwordTitle, text: $viewModel.password)
    }

    var loginButton: some View {
        Button(action: viewModel.loginButtonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(loginButtonColor(with: viewModel.loginResult))
                if viewModel.loginResult == .loading {
                    LoadingView()
                } else {
                    Text(viewModel.loginButtonTitle)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                }
            }
            .frame(height: 48, alignment: .center)
        }
    }

    // MARK: - Helpers

    func loginButtonColor(with status: LoginResult) -> Color {
        switch viewModel.loginResult {
        case .neutral, .loading: return .blue
        case .failure: return .red
        case .success: return .green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView<LoginModel, AppRouter>(router: AppRouter())
                .environmentObject(LoginMocks.defaultMock)
        }
    }
}
