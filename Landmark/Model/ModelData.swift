//
//  ModelData.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    
    // @Published 어트리뷰트를 추가해줌으로써 데이터의 변경을 감지한다.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else { fatalError("Couldn't find \(fileName) in main Bundle") }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
