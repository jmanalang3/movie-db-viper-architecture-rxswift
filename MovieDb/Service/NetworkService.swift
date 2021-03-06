//
//  NetworkService.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Moya

enum NetworkService {
    case genreMovie
    case trendingMovie
    case upComingMovie
    case nowPlaying
    case popularMovie
    case nowPlayingMoviePaging(page: Int)
    case trendingMoviePaging(page: Int)
    case upComingMoviePaging(page: Int)
    case detailMovie(id: Int)
    case movieByGenres(genre: String)
    case movieByGenresPaging(genre: String, page: Int)
    case moviesCast(id: Int)
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    public var path: String {
        switch self {
        case .genreMovie:
            return "genre/movie/list"
        case .trendingMovie:
            return ""
        case .upComingMovie:
            return "movie/upcoming"
        case .nowPlaying, .nowPlayingMoviePaging, .trendingMoviePaging, .upComingMoviePaging:
            return "movie/now_playing"
        case .popularMovie:
            return "movie/popular"
        case .detailMovie(id: let id):
            return "movie/\(id)"
        case .movieByGenres, .movieByGenresPaging:
            return "discover/movie"
        case .moviesCast(id: let id):
            return "movie/\(id)/credits"
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .genreMovie, .upComingMovie, .nowPlaying, .popularMovie, .detailMovie, .moviesCast:
            return .requestParameters(parameters: ["api_key": "c8ff8c510e74a75a3643870242745d71"], encoding: URLEncoding.default)
        case .nowPlayingMoviePaging(page: let paging), .trendingMoviePaging(page: let paging), .upComingMoviePaging(page: let paging):
            return .requestParameters(parameters: ["api_key": "c8ff8c510e74a75a3643870242745d71", "page": paging], encoding: URLEncoding.default)
        case .movieByGenres(genre: let genre):
            return .requestParameters(parameters: ["api_key": "c8ff8c510e74a75a3643870242745d71","with_genres": genre], encoding: URLEncoding.default)
        case .movieByGenresPaging(genre: let genre, page: let paging):
            return .requestParameters(parameters: ["api_key": "c8ff8c510e74a75a3643870242745d71","with_genres": genre,"page": paging], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let parameters = ["X-Mobile-App": "ios", "Content-Type": "application/json", "Accept": "application/json"]
        return parameters
    }
}
