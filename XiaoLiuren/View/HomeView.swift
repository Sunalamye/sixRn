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
        VStack {
            Button {
                vm.splitNowYunShin()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 100)
                    .foregroundStyle(.gray)
                    .overlay {
                        Threeshin(vm: vm)
                            .foregroundColor(.white)
                    }
            }
            EasyBodyInfo(model: NSModel().getModel(Str: vm.mainBody))
                .foregroundColor(.black.opacity(0.6))
        }
        .padding()
        .background{
            TransparentBlurView(removeAllFilter: false)
                .blur(radius: 15)
                .background(.white.opacity(0.3))
        }
        .clipShape(.rect(cornerRadius: 15,style: .circular))
    }
    
   
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}