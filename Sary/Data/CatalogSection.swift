//
//  CatalogSection.swift
//  Sary
//
//  Created by Amr Ahmed on 08/09/2021.
//

import Foundation

struct CatalogSection : Codable {
    
    var id : Int?
    var title : String?
    var subtitle : String?
    var data : [CatalogItem]?
    var data_type : String?
    var show_title : Bool?
    var ui_type : String?
    var row_count : Int?
    var show_more_enabled : Bool?
    
}
