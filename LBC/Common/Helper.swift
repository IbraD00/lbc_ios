//
//  Helper.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 30/03/2021.
//

import UIKit


extension UIImageView {
    func getImageFromUrl(url: String) {
        APIService.sharedInstance.getImage(from: URL(string: url)!) { (data) in
            if let imageData = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "preview")
                }
            }
        }
    }
}
    
