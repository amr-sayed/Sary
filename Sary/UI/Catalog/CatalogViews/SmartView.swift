//
//  SmartView.swift
//  Sary
//
//  Created by Amr Ahmed on 08/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct SmartView: View{
    var smartSection = CatalogSection()
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            VStack{
                if  !(smartSection.title?.isEmpty ?? false){
                    Text(smartSection.title ?? "")
                        .font(Font.system(size:20, design: .default))
                        .padding(.horizontal,16)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                HStack {
                    ForEach (0 ..< (smartSection.data?.count)!, id: \.self){ index in
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                    .fill(Color.white).shadow(radius: 2)
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                WebImage(url: URL(string: smartSection.data?[index].image ?? ""))
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            Text(smartSection.data?[index].name ?? "")
                                .padding(.bottom,5)
                                .font(Font.system(size:12, design: .default))
                        }.padding(.horizontal,5)
                    }
                }.padding(.all,16)
                
            }
        }
    }
}
