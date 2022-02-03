//
//  HomeView.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 01/02/22.
//

import Foundation
import SwiftUI

class HomeInput: ObservableObject {
    var name: String

    init(username: String) {
        self.name = username
    }
}

struct HomeView: View {

    @EnvironmentObject var input: HomeInput

    var body: some View {
        Text("Home")
            .navigationTitle("Welcome \(input.name)")
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .environmentObject(HomeInput(username: "User"))
        }
    }
}
