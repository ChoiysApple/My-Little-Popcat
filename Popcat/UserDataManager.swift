//
//  UserDataManager.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/24.
//

import Foundation

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}


