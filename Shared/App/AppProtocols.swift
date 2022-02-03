//
//  AppProtocols.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 01/02/22.
//

import Foundation
import SwiftUI

typealias RouteType = Hashable & Identifiable & CaseIterable

protocol Routing {
    associatedtype Route: RouteType
    associatedtype Scene: View

    @ViewBuilder func view(for route: Route) -> Scene
 }

protocol ViewModel: ObservableObject {
    associatedtype Route: RouteType

    var navigationRoute: Route? { get set }
}

protocol AppView: View {
    associatedtype VM: ViewModel
    associatedtype Router: Routing where Router.Route == VM.Route

    var viewModel: VM { get }
    var viewModelEnvironmentObject: EnvironmentObject<VM>.Wrapper { get }
    var router: Router { get }
}

extension AppView where Router.Route == VM.Route {

    /// creates all navigation links necessary to each AppView
    @ViewBuilder
    var navigationLinks: some View {
        ForEach(Array(Router.Route.allCases), id: \.self) {
            if let tag = $0 as? VM.Route {
                NavigationLink(
                    destination: router.view(for: $0),
                    tag: tag,
                    selection: viewModelEnvironmentObject.navigationRoute,
                    label: { EmptyView() }
                  )
            } else {
                fatalError("View and ViewModel Routers should be the same.")
            }
        }
    }
}
