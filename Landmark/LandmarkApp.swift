//
//  LandmarkApp.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI

@main // -> APP의 진입점 식별
struct LandmarkApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
