//
//  RickAndMortyService.swift
//  RickAndMorty
//
//  Created by Erkan Sevim on 13.05.2022.
//

import Alamofire

enum RickAndMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func charackterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}
protocol IRickAndMortyService {
    func fetchAllData(response:@escaping ([Result]?) -> Void )
}

struct RickAndMortyService: IRickAndMortyService {
    func fetchAllData(response:@escaping ([Result]?) -> Void) {
        AF.request(RickAndMortyServiceEndPoint.charackterPath()).responseDecodable(of: RickAndMortyModel.self) { (model) in
            guard let data = model.value  else{
                // Error
                response(nil)
                return
            }
            response(data.results)
            
        }
    }
}
