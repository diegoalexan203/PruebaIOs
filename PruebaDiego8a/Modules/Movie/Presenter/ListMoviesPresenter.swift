//
//  ListMoviesPresenter.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

class ListMoviesPresenter:  ListMoviesViewToPresenterProtocol {

    //MARK: - Properties
    var interactor: ListMoviesPresentertoInteractoProtocol?
    var view : ListMoviesPresentertoViewProtocol?
    var router: ListMoviesPresenterToRouterProtocol?
    
    func viewWillAppear() {
        interactor?.getMovies(page: "1")
    }
    
}

extension ListMoviesPresenter: ListMoviesInteractorToPresenterProtocol{
    func refreshData(movies: ResponseMovies) {
        view!.updateView(moviesResponse: movies)
    }
}
