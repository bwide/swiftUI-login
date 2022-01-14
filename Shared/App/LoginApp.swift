//
//  LoginApp.swift
//  Shared
//
//  Created by Bruno Wide on 25/12/21.
//

import SwiftUI

@main
struct LoginApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView<LoginModel>().environmentObject(LoginModel())
        }
    }
}
