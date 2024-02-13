//
//  Movie.swift
//  FlixsterPt1
//
//  Created by Barsha Chaudhary on 1/25/24.
//

import Foundation

struct Movie: Decodable{
    let title: String
    let poster_path : String
    let overview: String
    let backdrop_path: URL
    let vote_count: Float
    let vote_average: Float
    let popularity: Float
    var id: Int64
    let release_date: String
    static var posterBaseURLString185: String = "https://image.tmdb.org/t/p/w185"
    static var posterBaseURLString200: String = "https://image.tmdb.org/t/p/w400"
    static var backdropBaseURLString: String = "https://image.tmdb.org/t/p/w500"
}

struct MoviesResponse: Decodable {
    static var allData: [Movie] = [Movie]()
    let results: [Movie]
}

//extension Movie {
//    static var mockMovies: [Movie] = [
//        Movie(title: "Wonka",
//              overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
//              artworkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!,
//              releaseDate: "2023-12-06",
//              popularity: 3221.716,
//              voteAverage: 7.195),
//        Movie(title: "Aquaman and the Lost Kingdom",
//              overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
//              artworkUrl100: URL(string:
//                 "https://image.tmdb.org/t/p/w500/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg")!,
//              releaseDate: "2023-12-20",
//              popularity: 2141.691,
//              voteAverage: 6.787),
//        Movie(title: "Lift",
//                      overview: "An international heist crew, led by Cyrus Whitaker, race to lift $500 million in gold from a passenger plane at 40,000 feet.",
//                      artworkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/gma8o1jWa6m0K1iJ9TzHIiFyTtI.jpg")!,
//                      releaseDate: "2024-01-10",
//                      popularity: 1113.522,
//                      voteAverage: 6.407),
//
//        Movie(title: "Society of the Snow",
//              overview: "On October 13, 1972, Uruguayan Air Force Flight 571, chartered to take a rugby team to Chile, crashes into a glacier in the heart of the Andes.",
//              artworkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/2e853FDVSIso600RqAMunPxiZjq.jpg")!,
//              releaseDate: "2023-12-13",
//              popularity: 1005.821,
//              voteAverage: 8.061),
//
//        Movie(title: "Migration",
//              overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
//              artworkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!,
//              releaseDate: "2023-12-06",
//              popularity: 844.892,
//              voteAverage: 7.8),
//        Movie(title: "Role Play",
//                      overview: "Emma has a wonderful husband and two kids in the suburbs of New Jersey – she also has a secret life as an assassin for hire – a secret that her husband David discovers when the couple decide to spice up their marriage with a little role play.",
//                      artworkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/7MhXiTmTl16LwXNPbWCmqxj7UxH.jpg")!,
//                      releaseDate: "2023-12-14",
//                      popularity: 707.832,
//                      voteAverage: 5.812)
//]
//}
