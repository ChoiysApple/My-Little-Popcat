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
    AssetData.init(catName: "Hood Cat", closedImageName: "originalcat_closed", openedImageName: "hoodcat_opened", mainImageName: "hoodcat_opened", audioSourceName: "popcat_original_sound", unlockThreshold: 500),
    AssetData.init(catName: "Rock Cat", closedImageName: "rockcat_closed", openedImageName: "rockcat_opened", mainImageName: "rockcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Tua lek", closedImageName: "Tualek_closed", openedImageName: "Tualek_opened", mainImageName: "Tualek_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Cosmic Red", closedImageName: "cosmicRed_closed", openedImageName: "cosmicRed_opened", mainImageName: "cosmicRed_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Bubble Pop", closedImageName: "gumcat_closed", openedImageName: "gumcat_opened", mainImageName: "gumcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Drool Cat", closedImageName: "droolcat_closed", openedImageName: "droolcat_opened", mainImageName: "droolcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Gray Cat", closedImageName: "graycat_closed", openedImageName: "graycat_opened", mainImageName: "graycat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Orange Cat", closedImageName: "orangecat_closed", openedImageName: "orangecat_opened", mainImageName: "orangecat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Pastel Cat", closedImageName: "pastelcat_closed", openedImageName: "pastelcat_opened", mainImageName: "pastelcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Pepi", closedImageName: "pepi_closed", openedImageName: "pepi_opened", mainImageName: "pepi_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Pixel Cat", closedImageName: "pixelcat_closed", openedImageName: "pixelcat_opened", mainImageName: "pixelcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Pop-999", closedImageName: "pop999_closed", openedImageName: "pop999_opened", mainImageName: "pop999_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),
    AssetData.init(catName: "Star Cat", closedImageName: "starcat_closed", openedImageName: "starcat_opened", mainImageName: "starcat_closed", audioSourceName: "popcat_original_sound", unlockThreshold: 1500),

    AssetData.init(catName: "Hunter", closedImageName: "hunter_closed", openedImageName: "hunter_opened", mainImageName: "hunter_closed", audioSourceName: "hunter_sound", unlockThreshold: 10)
]

let defaultAssetData = AssetDataList[0]
