//
//  HomeRouter.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterProtocol {
    static func createModule() -> HomeViewController {
        let controller = HomeViewController()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocol = HomeRouter()
        
        controller.presentor = presenter
        controller.title = "Movie DB"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
    
    func showMovieController(navigationController: UINavigationController,  menuEnum: HomeEnumSection) {
        
    }
}