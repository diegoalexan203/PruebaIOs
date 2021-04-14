//
//  ListMoviesInteractorToPresenterProtocol.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

protocol ListMoviesInteractorToPresenterProtocol : class {
    func refreshData( movies: ResponseMovies)
}
