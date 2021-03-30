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

extension UIColor {
    static var grayColor = UIColor.init(red: 241/255, green: 241/255, blue: 241/255, alpha: 255/255)
}

struct Helper {
    public static let sharedInstance = Helper()
    
    func getDate(dateString: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy"

        if let date = dateFormatterGet.date(from: dateString) {
            return dateFormatterPrint.string(from: date)
        }
        
        return dateFormatterGet.string(from: Date())
    }
}
    
