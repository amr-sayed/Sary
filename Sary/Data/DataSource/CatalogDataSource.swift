//
//  CatalogDataSource.swift
//  NewsApp
//
//  Created by Amr Ahmed on 8/09/2021.
//

import Foundation
import Combine

class CatalogDataSource : BaseDataSource  {
    
    func loadBanner() -> AnyPublisher<BannerReseponse,Error> {
        let agent = Agent()
        let url = baseURL + "76091/banners/"
        return agent.run(url: url)
                    .map(\.value)
                    .eraseToAnyPublisher()
    }
    
    func loadCatalog() -> AnyPublisher<CatalogResponse,Error> {
        let agent = Agent()
        let url = baseURL + "76097/catalog/"
        return agent.run(url: url)
                    .map(\.value)
                    .eraseToAnyPublisher()
    }
}


