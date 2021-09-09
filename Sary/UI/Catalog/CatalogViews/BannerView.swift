//
//  BannerView.swift
//  Sary
//
//  Created by Amr Ahmed on 08/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import AlertToast


struct BannerView : View {
    @State var bannerList = [Banner]()
    @State var presentingToast: Bool = false

    var body: some View {
        
        TabView {
            ForEach (0 ..< bannerList.count,id: \.self){ index in
                WebImage(url: URL(string: bannerList[index].image ?? ""))
                    .resizable()
                    .indicator(.activity)
                    .cornerRadius(10)
                    .padding(.horizontal,16)
                    .onTapGesture {
                        presentingToast = true
                    }
                    .toast(isPresenting: $presentingToast) {
                        AlertToast(type: .regular, title: bannerList[index].link)
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(width: .infinity, height:200, alignment: .center)
        
    }
}
