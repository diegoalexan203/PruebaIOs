//
//  ListMoviesViewToPresenterProtocol.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 13/04/21.
//

import Foundation

protocol ListMoviesViewToPresenterProtocol : class {
    var interactor: ListMoviesPresentertoInteractoProtocol? { get set }
    var router: ListMoviesPresenterToRouterProtocol? { get set }
    var view: ListMoviesPresentertoViewProtocol? { get set }
    func viewWillAppear()
}
