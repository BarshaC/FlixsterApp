//
//  DetailViewController.swift
//  FlixsterPt1
//
//  Created by Barsha Chaudhary on 1/26/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    var movie: Movie!
    
    @IBOutlet weak var movieTitleDetail: UILabel!
    @IBOutlet weak var movieImageviewDetail: UIImageView!
    @IBOutlet weak var movieOverviewDetail: UILabel!
    
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var relaseDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark

        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString200 + movie.poster_path)!, into: movieImageviewDetail)
        
        movieTitleDetail.text = movie.title
        movieOverviewDetail.text = movie.overview
        relaseDate.text = "Released: " +  movie.release_date
        voteAverage.text = "Vote Average: " + String(movie.vote_average)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "similarMoviesSegue" {
            let movieListViewController = segue.destination as? ViewController
            movieListViewController?.similarMovieId = movie.id
        }
    }
    
    @IBAction func similarMovies(_ sender: UIButton) {
        performSegue(withIdentifier: "similarMoviesSegue", sender: sender)
    }

}
