//
//  ReviewService.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation
import Alamofire

final class ReviewService: ReviewWorker {
    private let reviewEntityMapper: ReviewEntityMapper
    private let reviewsBaseApiUrl: String = "http://localhost:3002/reviews/"
    
    
    init(reviewEntityMapper: ReviewEntityMapper) {
        self.reviewEntityMapper = reviewEntityMapper
    }
    
    func getReviewsFor(id: String, completion: @escaping (Result<[Review], Error>) -> Void) {
        let reviews: [Review] = [
            .init(productId: "1", locale: "NL", text: "Mooie broek", rating: 4),
            .init(productId: "1", locale: "NL", text: "Heel mooi hoor, echt top product", rating: 5),
            .init(productId: "1", locale: "NL", text: "Lelijk", rating: 1),
            .init(productId: "1", locale: "NL", text: "Zitten scheuren in, al na 1 week. Echt jammer", rating: 2)
                ]
        
        completion(.success(reviews))
        
//        AF.request("\(reviewsBaseApiUrl)\(id)").responseJSON(completionHandler: { [weak self] response in
//            switch response.result {
//            case .success:
//                guard let self = self, let data = response.data else { return }
//
//                do {
//                    let reviewEntities = try JSONDecoder().decode([ReviewEntity].self, from: data)
//                    let reviews = reviewEntities.compactMap({ self.reviewEntityMapper.map(entity: $0) })
//                    completion(.success(reviews))
//
//                } catch {
//                    print("Error: \(error)")
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//                completion(.failure(error))
//            }
//        })
    }
}
