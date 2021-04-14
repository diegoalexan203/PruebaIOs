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

        // Do any additional setup after loading the view.
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell ()
    }
}

extension LisMoviesViewController: ListMoviesPresentertoViewProtocol{
    func updateView(moviesResponse: ResponseMovies) {
    
    }
    
    
}
