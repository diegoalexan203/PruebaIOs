//
//  ListMoviesRoute.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation
import UIKit

class ListMoviesRoute: ListMoviesPresenterToRouterProtocol {

    static func createModule() -> UIViewController {
        
        let moduleStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: LisMoviesViewController.self))
        let view = moduleStoryboard.instantiateViewController(withIdentifier: "LisMoviesViewController") as! LisMoviesViewController

        let presenter : ListMoviesViewToPresenterProtocol & ListMoviesInteractorToPresenterProtocol = ListMoviesPresenter()
        let interactor : ListMoviesPresentertoInteractoProtocol = ListMoviesInteractor()
        let router: ListMoviesPresenterToRouterProtocol = ListMoviesRoute()
//        var list : [MoviesEntity] = []
//        let view = ListMoviesViewController(presenter: presenter, moviesList: list)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
