//
//  ImageView.swift
//  StarterProject
//
//  Created by Binshad on 15/11/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView{
    
    
    enum ImageViewDownloadresult : String {
        case success = "Downloaded the image successfully"
        case urlError = "The url provided is not valid"
        case generalFailure = "The download failed unacceptadely"
        case responseError = "The resposne produced Error"
        case imageConversionError = "The data Conversion Failed. Please check type of file in urlPath"
        case dataConversionError = "The Image COnversion Failed. Please check type of file in urlPath"


    }

    /* Ensure this method is not used in reUsable components like tableView collectionView etc */
    
    
    func downloadImageFromURl(urlString : String, completion : @escaping (ImageViewDownloadresult)->()){
    
        guard let imageURl = URL(string: urlString) else { completion(.urlError); return }
       
        
        let session = URLSession.shared.dataTask(with: imageURl) { (data, repsone, err) in
            
            if err != nil{
                print(err?.localizedDescription ?? "Failed to get the image")
                completion(.responseError)
                return
            }else{
            
                DispatchQueue.main.async {
                    guard let data = data else { completion(.dataConversionError); return }
                    guard let image = UIImage( data: data) else { completion(.imageConversionError); return }
                    self.image = image
                    completion(.success)
                }
            }
        };session.resume()
    }
}
