//
//  ContentView.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/8/25.
//

import SwiftUI

enum TabViewEnum{
    case home
}

struct ContentView: View {
    @State var select: TabViewEnum = .home

    var body: some View {
        ZStack {
            Image(.joshCarterWJL4C7ETlI)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            HomeView()
            .frame(width: UIScreen.main.bounds.width*0.85, alignment: .center)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
