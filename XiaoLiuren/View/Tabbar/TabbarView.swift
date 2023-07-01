//
//  TabbarView.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/7/1.
//

import SwiftUI


enum TabViewEnum{
    case home
}


struct TabbarView: View {
    
    @State var select: TabViewEnum = .home
    
    var body: some View {
        TabView(selection:$select) {
            HomeView()
                .tag(TabViewEnum.home)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
