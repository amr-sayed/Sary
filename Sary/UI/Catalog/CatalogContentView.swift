//
//  CatalogContentView.swift
//  Sary
//
//  Created by Amr Ahmed on 08/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI

enum UITypes : String {
    case SMART = "smart"
    case GROUP = "group"
    case BANNER = "banner"
}

struct CatalogContentView: View {
    
    @StateObject var viewModel = CatalogViewModel()
    
    var body: some View {
        
        ScrollView{
            VStack {
                HStack{
                    Image("ic_cart")
                    Spacer()
                    HStack{
                        Image("ic_arrow_down")
                            .padding(.vertical,5)
                            .padding(.leading,10)
                        Text("My Home")
                            .font(Font.system(size:14, design: .default))
                            .padding(.vertical,5)
                            .padding(.trailing,10)
                        
                    }.background(Colors.black10)
                    .cornerRadius(10)
                    
                    Spacer()
                    Image("ic_sary")
                        .resizable()
                        .padding(.trailing,5)
                        .frame(maxWidth: 80,maxHeight: 30, alignment: .trailing)
                }
                .padding(.horizontal,10)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 50, alignment: .topLeading)
                
                if (viewModel.bannerList.count > 0){ BannerView(bannerList: viewModel.bannerList)}
                
                ForEach (0 ..< viewModel.catalogList.count , id:\.self) { index in
                    let item = viewModel.catalogList[index]
                    
                    if item.data_type == UITypes.SMART.rawValue {
                        SmartView(smartSection: item)
                    }else if item.data_type == UITypes.GROUP.rawValue
                                || item.data_type == UITypes.BANNER.rawValue {
                        GroupView(groupSection: item)
                    }
                }
                
                if viewModel.loading {
                    ProgressView()
                }
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }
        
    }
}

struct CatalogContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogContentView()
    }
    
    
}
