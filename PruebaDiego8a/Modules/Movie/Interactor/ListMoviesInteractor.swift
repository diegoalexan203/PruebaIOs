//
//  ListMoviesInteractor.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

class ListMoviesInteractor: ListMoviesPresentertoInteractoProtocol {
        //MARK: -Properties
    var presenter : ListMoviesInteractorToPresenterProtocol?
    
    func getMovies(page: String)   {
        let service = MovieService()
            service.getMovies(page: page){ [weak self]response,Error  in
                if (response != nil){
                    DispatchQueue.main.async {
                        self!.presenter!.refreshData(movies: response!)
                    }
                }else{
                    print(Error!)
                }
       
        }
    }
}
