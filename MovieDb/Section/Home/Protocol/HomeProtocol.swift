//
//  HomeProtocol.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingUpcomingMovie()
    func startFechingPlayingNowMovie()
    func showMovieController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol: class{
    func showUpcomingMovies(data: [UpcomingMoviesModel]?)
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?)
    func showError(error: String)
    func isLoading(isLoading: Bool)
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> HomeViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func startFetchingUpcomingMovie()
    func startFechingPlayingNowMovie()
}

protocol InteractorToPresenterProtocol: class {
    func fetchedUpcomingMoviesSuccess(data: [UpcomingMoviesModel]?)
    func showNowPlayingMovie(data: [UpcomingMoviesModel]?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
