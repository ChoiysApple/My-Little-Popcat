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
}

let defaultAssetData = AssetData.init(catName: "Pop Cat", closedImageName: "popcat_closed", openedImageName: "popcat_opened", mainImageName: "popcat_closed", audioSourceName: "popcat_original_sound")

let AssetDataList = [
    AssetData.init(catName: "Pop Cat", closedImageName: "popcat_closed", openedImageName: "popcat_opened", mainImageName: "popcat_closed", audioSourceName: "popcat_original_sound"),
    AssetData.init(catName: "Original Cat", closedImageName: "originalcat_closed", openedImageName: "originalcat_opened", mainImageName: "originalcat_closed", audioSourceName: "popcat_original_sound"),
    AssetData.init(catName: "Hood Cat", closedImageName: "hoodcat_closed", openedImageName: "hoodcat_opened", mainImageName: "hoodcat_opened", audioSourceName: "popcat_original_sound")
]
