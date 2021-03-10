//
//  MediaData.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/03/10.
//

import Foundation

class MediaInformation {
        
    static let sharedInformation = MediaInformation()
    
    var audioName: String?
        
    private init() { }
}
