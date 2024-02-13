//
//  PostersViewController.swift
//  FlixsterPt1
//
//  Created by Barsha Chaudhary on 2/7/24.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell

        // Use the indexPath.item to index into the albums array to get the corresponding album
        let movie = movies[indexPath.item]

        // Get the artwork image url
        let imageUrl = movie.poster_path

        // Set the image on the image view of the cell
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString200 + imageUrl)!, into: cell.albumImageView)

        return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        
        let numberOfColumns: CGFloat = 3
        
        let width = collectionView.bounds.width / numberOfColumns
        
        layout.itemSize = CGSize(width: width, height: 1.33333  * width)
        
        collectionView.dataSource = self
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=de2585c068f6f04beba2f06e3e2af281")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                // Try to parse the JSON into a dictionary (aka: [String: Any])
                let response = try decoder.decode(MoviesResponse.self, from: data)
                let movies = response.results
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }
            
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell),
           let detailViewController = segue.destination as? DetailViewController {
            let movie = movies[indexPath.item]
            
            detailViewController.movie = movie
        }
    }
    

}
