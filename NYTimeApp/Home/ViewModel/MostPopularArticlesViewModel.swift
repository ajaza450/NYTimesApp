//
//  MostPopularArticlesViewModel.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 27/09/24.
//

import Foundation

class MostPopularArticlesViewModel: ObservableObject{
    @Published var articles: [Article] = []
    @Published var error: NetworkError?
    @Published var hasError = false
    private let networkingManager: NetworkingManagerImpl
    
    // MARK: - Intitialize networkingManager

    init(_ networkingManager: NetworkingManagerImpl = NetworkingManager.shared){
        self.networkingManager = networkingManager
    }
    
    // MARK: - Fetch Articles
  
    @MainActor
    func fetchArtical() async {
        do {
            let endpoint = Endpoint.mostViewed(section: "all-sections", period: 7)
            let res = try await networkingManager.request(.shared,endpoint, modelType: Json4Swift_Base.self)
            //print("result",res.results)
            articles =  res.results ?? []
        }catch  {
            self.hasError = true
            if let networkError = error as? NetworkError {
                self.error = networkError
            }else{
                self.error = .custom(error: error.localizedDescription)
            }
        }
        
    }
    
    

}



