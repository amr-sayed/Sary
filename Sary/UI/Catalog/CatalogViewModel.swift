//
//  CatalogViewModel.swift
//  Sary
//
//  Created by Amr Ahmed on 08/09/2021.
//

import Foundation
import Combine

class CatalogViewModel: ObservableObject {
   
    @Published var bannerList = [Banner]()
    @Published var catalogList = [CatalogSection]()
    @Published var loading = true
    
    
    let dataSource = CatalogDataSource()
    var subscribtion = Set<AnyCancellable>()
    
    init() {
        loadCatalog()
    }
    
    func loadCatalog()  {
        Publishers.Zip(dataSource.loadBanner(), dataSource.loadCatalog())
            .sink(receiveCompletion: { completion in
                // if all done
            }, receiveValue: { response1, response2 in
                self.bannerList = response1.result ?? [Banner]()
                self.catalogList = response2.result ?? [CatalogSection]()
                self.loading.toggle()
            }
            )
            .store(in: &subscribtion)
    }
}
