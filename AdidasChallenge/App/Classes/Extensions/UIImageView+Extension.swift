//
//  UIImageView+Extension.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import UIKit
import Foundation

private let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    /**
     Downloads an image from URL
     - Parameter link: URL of the image
     - Parameter mode: Content mode (Options to specify how a view adjusts its content when its size changes)
     */
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, defaultImage: UIImage? = UIImage(named: "default-icon")) {
        let link = makeStringURLFriendly(string: link)
        
        let imageUrlString = link
        
        guard let url = URL(string: link) else {
            image = defaultImage ?? UIImage()
            return
        }
        
        if let imageFromCache = imageCache.object(forKey: link as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let imageToCache = UIImage(data: data)
            else {
                let image = UIImage(named: "default-icon") ?? UIImage()
                imageCache.setObject(image, forKey: link as AnyObject)
                DispatchQueue.main.async {
                    self.image = image
                }
                return
            }
            
            DispatchQueue.main.async {
                if imageUrlString == link {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache, forKey: link as AnyObject)
            }
        }.resume()
    }
    
    private func makeStringURLFriendly(string: String) -> String {
        return string.replacingOccurrences(of: " ", with: "%20")
    }
}
