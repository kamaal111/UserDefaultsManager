//
//  UserDefaultsManager.swift
//
//
//  Created by Kamaal Farah on 17/10/2020.
//

import Foundation

public class UserDefaultsManager {

    public var storage: UserDefaults

    private var jsonDecoder: JSONDecoder?

    public init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }

    public func save(this data: Any?, to key: String) {
        storage.set(data, forKey: key)
    }

    public func getString(from key: String) -> String? {
        storage.string(forKey: key)
    }

    public func getInt(from key: String) -> Int {
        storage.integer(forKey: key)
    }

    public func getBool(from key: String) -> Bool {
        storage.bool(forKey: key)
    }

    public func getArray<T>(from key: String) -> [T]? {
        storage.array(forKey: key) as? [T]
    }

    public func getObject<T>(from key: String) -> T? {
        storage.object(forKey: key) as? T
    }

    public func getDecodedObject<T: Decodable>(from key: String) -> T? {
        guard let data: Data = getObject(from: key) else { return nil }
        if let jsonDecoder = jsonDecoder {
            return try? jsonDecoder.decode(T.self, from: data)
        }
        let jsonDecoder = JSONDecoder()
        self.jsonDecoder = jsonDecoder
        return try? jsonDecoder.decode(T.self, from: data)
    }

}
