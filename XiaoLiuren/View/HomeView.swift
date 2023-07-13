//
//  Home.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/6/30.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = ThreeShinModel()
    
    var body: some View {
        ZStack {
            Image(.joshCarterWJL4C7ETlI)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(2)
                .offset(y:-350)

            VStack {
                Button {
                    vm.splitNowYunShin()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 100)
                        .foregroundStyle(Color(.background2))
                        .overlay {
                            Threeshin(vm: vm)
                                .foregroundColor(Color(.secon))
                        }
                }
                EasyBodyInfo(model: NSModel().getModel(Str: vm.mainBody))
                    .foregroundColor(Color(.background))
            }
            .padding()
            .transparentBlur(removeAllFilter: false)
            .clipShape(.rect(cornerRadius: 15,style: .circular))
            .frame(width: UIScreen.main.bounds.width*0.85, alignment: .center)
        }
        
    }
    
   
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
