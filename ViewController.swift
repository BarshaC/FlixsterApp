//
//  ViewController.swift
//  FlixsterPt1
//
//  Created by Barsha Chaudhary on 1/25/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    //create bool if detail is segue, default false, if it's has id set it to true
    //
    @IBOutlet weak var navigation: UINavigationItem!
    var movies: [Movie] = [Movie]()
    var similarMovieId: Int64 = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        tableView.dataSource = self
        if (similarMovieId == 0) {
            
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=de2585c068f6f04beba2f06e3e2af281")!

            // Use the URL to instantiate a request
            let request = URLRequest(url: url)

            // Create a URLSession using a shared instance and call its dataTask method
            // The data task method attempts to retrieve the contents of a URL based on the specified URL.
            // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
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

                // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
                // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
                do {
                    let decoder = JSONDecoder()

                    // Use the JSON decoder to try and map the data to our custom model.
                    // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                    let response = try decoder.decode(MoviesResponse.self, from: data)

                    // Access the array of tracks from the `results` property
                    let movies = response.results
                    DispatchQueue.main.async {

                        // Set the view controller's tracks property as this is the one the table view references
                        self?.movies = movies

                        // Make the table view reload now that we have new data
                        self?.tableView.reloadData()
                    }
//                    print("✅ \(movies)")

                } catch {
                    print("❌ Error parsing JSON: \(error.localizedDescription)")
                }
            }

            // Initiate the network request
            task.resume()
            tableView.dataSource = self
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = movies[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
        }

    }




}

