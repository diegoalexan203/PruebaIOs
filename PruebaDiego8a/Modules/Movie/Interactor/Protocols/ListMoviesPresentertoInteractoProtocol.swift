//
//  ListMoviesPresentertoInteractoProtocol.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

protocol ListMoviesPresentertoInteractoProtocol: class {
    var presenter : ListMoviesInteractorToPresenterProtocol? {get set}
    
    func getMovies(page: String)
}
