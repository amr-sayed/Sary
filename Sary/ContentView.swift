//
//  ContentView.swift
//  Sary
//
//  Created by Amr Ahmed on 07/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ (geometry : GeometryProxy) in
            
            TabView{
                CatalogContentView()
                    .tabItem {
                        VStack {
                            Image("ic_store")
                            Text("Store").foregroundColor(.black)
                        }
                    }
                Text("Orders")
                    .tabItem {
                        TabBarIcon(width: 40, height: 40,systemIconName : "ic_order",tabName: "Orders")
                    }
                
                Text("Search")
                    .tabItem {
                        TabBarIcon(width: 40, height: 40,systemIconName : "ic_search",tabName: "Seach")
                    }
            } .accentColor(.black)
            
        }
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    var body: some View {
        VStack {
            Image(systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
