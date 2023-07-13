//
//  TabbarView.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/7/1.
//

import SwiftUI


enum TabViewEnum:String,CaseIterable{
    case home,note,calendar,set
    
    var image:Image{
        switch self {
        case .home:
            Image(systemName: "house")
        case .set:
            Image(systemName: "gearshape.2.fill")
        case .calendar:
            Image(systemName: "calendar")
        case .note:
            Image(systemName: "highlighter")
        }
    }
    var intValue:Int{
        switch self {
        case .home:
            1
        case .note:
            2
        case .calendar:
            3
        case .set:
            4
        }
    }
}


struct TabbarView: View {
    
    @State var select: TabViewEnum = .home
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection:$select) {
                HomeView()
                    .tag(TabViewEnum.home)
                
                Text("test")
                    .tag(TabViewEnum.set)
                
            }
            HStack(){
                ForEach(TabViewEnum.allCases,id:\.self){tab in
                    TabBarItem(select:$select,tab: tab)
                }
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .padding(.top)
            .background(Color(.background))
            
        }
    }
}

struct TabBarItem: View {
    @Binding var select:TabViewEnum
    let tab:TabViewEnum
    
    var body: some View {
            ZStack{
                Button(action: {
                    withAnimation {
                        select = tab
                    }
                }, label: {
                    HStack{
                        tab.image
                            .frame(width: 20, height: 20)
                        if tab == select{
                            Text(tab.rawValue.localized)
                                .font(.system(size: 14))
                                .transition(.scale(scale: 0))
                        }
                    }
                    .foregroundStyle(Color(.main))
                })
            }
            .padding(.vertical,10)
            .padding(.horizontal,17)
            .background(Color(.background2))
            .clipShape(Capsule())
        
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
