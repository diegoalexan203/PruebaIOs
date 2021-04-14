//
//  LisMoviesViewController.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import UIKit

class LisMoviesViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var presenter: ListMoviesViewToPresenterProtocol?
    var movies : [MoviesEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LisMoviesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell ()
    }
}

extension LisMoviesViewController: ListMoviesPresentertoViewProtocol{
    func updateView(moviesResponse: ResponseMovies) {
        for movie in moviesResponse.movies! {
            self.movies.append(movie)
         }
//        moviesCollectionView.reloadData()
        DispatchQueue.main.async {
            self.moviesCollectionView.performBatchUpdates({ [weak self] in
            let visibleItems = self?.moviesCollectionView.indexPathsForVisibleItems ?? []
                self!.moviesCollectionView.reloadItems(at: visibleItems)
        })
        }
    }
    
    
}
