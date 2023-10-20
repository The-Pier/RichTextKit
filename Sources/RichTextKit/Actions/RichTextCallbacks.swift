//
//  File.swift
//  
//
//  Created by Adriano d'Alessandro on 20/10/23.
//

import Foundation


class RichTextCallbacks {
    var urlCallback: ((URL) -> Void)?
    var dataCallback: ((Data) -> Void)?
    
    
    func sendURL(url : URL) {
            // Notify the main app about the URL
            urlCallback?(url)
        }
    
    func sendData(data : Data) {
        dataCallback?(data)
    }
}
