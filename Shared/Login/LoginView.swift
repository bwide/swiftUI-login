//
//  LoginView.swift
//  Shared
//
//  Created by Bruno Wide on 25/12/21.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var model: LoginModel

    init(model: LoginModel = LoginModel()) {
        self.model = model
    }

    var body: some View {
        VStack(alignment: .center, spacing: 48) {
            usernameField
            passwordField
            loginButton
        }
        .padding(24)
    }

    var usernameField: some View {
        TextField(LoginModel.Static.usernameTitle, text: $model.username)
    }

    var passwordField: some View {
        TextField(LoginModel.Static.passwordTitle, text: $model.password)
    }

    var loginButton: some View {
        Button(action: model.loginButtonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                Text(model.loginButtonTitle)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(8)
            }
            .frame(height: 48, alignment: .center)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
    }
}
