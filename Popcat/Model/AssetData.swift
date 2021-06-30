//
//  AssetData.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/21.
//

import Foundation

struct AssetData: Codable {
    var catName: String
    var closedImageName: String
    var openedImageName: String
    var mainImageName: String
    var audioSourceName: String
    var unlockThreshold: Int
}


let AssetDataList = [
    AssetData.init(catName: "Pop Cat", closedImageName: "popcat_closed", openedImageName: "popcat_opened", mainImageName: "popcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 0),
    AssetData.init(catName: "Original Cat", closedImageName: "originalcat_closed", openedImageName: "originalcat_opened", mainImageName: "originalcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 100),
    AssetData.init(catName: "Hood Cat", closedImageName: "hoodcat_closed", openedImageName: "hoodcat_opened", mainImageName: "hoodcat_opened", audioSourceName: "popcat_original_sound", unlockThreshold: 500),
    AssetData.init(catName: "Black Cat", closedImageName: "blackcat_closed", openedImageName: "blackcat_opened", mainImageName: "blackcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1000),
    AssetData.init(catName: "Tua lek", closedImageName: "Tualek_closed", openedImageName: "Tualek_opened", mainImageName: "Tualek_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500)
]

let defaultAssetData = AssetDataList[0]
