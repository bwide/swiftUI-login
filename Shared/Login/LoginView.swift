//
//  LoginView.swift
//  Shared
//
//  Created by Bruno Wide on 25/12/21.
//

import SwiftUI
import Combine

struct LoginView<Model: LoginModelProtocol>: View {

    @EnvironmentObject var model: Model

    var body: some View {
        VStack(alignment: .center, spacing: 48) {
            usernameField
            passwordField
            loginButton
        }
        .padding(24)
    }

    var usernameField: some View {
        TextField(model.usernameTitle, text: $model.username)
    }

    var passwordField: some View {
        TextField(model.passwordTitle, text: $model.password)
    }

    var loginButton: some View {
        Button(action: model.loginButtonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(loginButtonColor(with: model.loginResult))
                if model.loginResult == .loading {
                    LoadingView()
                } else {
                    Text(model.loginButtonTitle)
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
        switch model.loginResult {
        case .neutral, .loading: return .blue
        case .failure: return .red
        case .success: return .green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView<LoginModel>()
                .environmentObject(LoginMocks.wrongPasswordMock)
        }
    }
}
