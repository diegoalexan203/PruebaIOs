//
//  ListMoviesPresentertoViewProtocol.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 13/04/21.
//

import Foundation

protocol ListMoviesPresentertoViewProtocol: class {
    func updateView(moviesResponse: ResponseMovies)
}
