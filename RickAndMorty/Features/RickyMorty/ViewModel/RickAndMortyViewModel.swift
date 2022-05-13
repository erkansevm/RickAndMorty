//
//  RickAndMortyViewModel.swift
//  RickAndMorty
//
//  Created by Erkan Sevim on 13.05.2022.
//

import Foundation

protocol IRickAndMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickAndMortyCharacters: [Result] { get set }
    var rickAndMortyService: IRickAndMortyService { get }
    
    var rickAndMortyVcOutput: RickAndMortyOutput? { get }
    
    func setDelegate(output: RickAndMortyOutput)
}

final class RickAndMortyViewModel: IRickAndMortyViewModel {
    var rickAndMortyVcOutput: RickAndMortyOutput?
    
  
    var rickAndMortyCharacters: [Result] = []
    private var isLoading = false
    let rickAndMortyService: IRickAndMortyService
    
    init() {
        rickAndMortyService = RickAndMortyService()
    }
    
    func fetchItems() {
        changeLoading()
        rickAndMortyService.fetchAllData { [weak self] (response) in
            self?.changeLoading()
            self?.rickAndMortyCharacters = response ?? []
            self?.rickAndMortyVcOutput?.saveDatas(values: self?.rickAndMortyCharacters ?? [])
        }
        
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickAndMortyVcOutput?.changeLoading(isLoad: isLoading)
    }
    
    func setDelegate(output: RickAndMortyOutput) {
        rickAndMortyVcOutput = output
    }
    
    
}
