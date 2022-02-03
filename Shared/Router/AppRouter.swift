//
//  AppRouter.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 01/02/22.
//

import Foundation
import SwiftUI

enum AppRoute: String, RouteType {
    var id: RawValue { rawValue }

    case login
    case home
}

struct AppRouter: Routing {
    @ViewBuilder
    func view(for route: AppRoute) -> some View {
        switch route {
        case .login:
            LoginView<LoginModel, AppRouter>(router: self)
                .environmentObject(LoginModel())
        case .home:
            HomeView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
