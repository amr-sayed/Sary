//
//  GroupView.swift
//  Sary
//
//  Created by Amr Ahmed on 08/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct GroupView : View {
    var groupSection = CatalogSection()
    
    init(groupSection : CatalogSection) {
        self.groupSection = groupSection
    }
    
    var body: some View {
        let column =  Array(repeating: GridItem(.flexible()), count: groupSection.row_count ?? 0)

        VStack{
            if !(groupSection.title?.isEmpty ?? false) {
                Text(groupSection.title ?? "")
                    .padding(.horizontal,20)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            if groupSection.ui_type == "grid" {
                LazyVGrid(columns: column){
                    GroupItems(groupSection: groupSection)
                }
            }else{
                ScrollView(.horizontal){
                    LazyHStack {
                        GroupItems(groupSection: groupSection)
                    }
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
    }
}

struct GroupItems : View {
    var groupSection = CatalogSection()
    var body: some View {
            let x = ((UIScreen.main.bounds.width ) / CGFloat(Float(groupSection.row_count!)))
            ForEach(0 ..< groupSection.data!.count, id: \.self) { index in
                WebImage(url: URL(string: groupSection.data?[index].image ?? ""))
                    .resizable()
                    .padding(.all,10)
                    .frame(width: x, height: 130, alignment: .center)
        }
    }
}



