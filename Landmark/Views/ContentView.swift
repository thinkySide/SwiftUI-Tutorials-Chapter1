//
//  ContentView.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI

// 콘텐츠와 레이아웃 구성을 위한 구조체
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
    
    // SwiftUI View를 커스터마이징 하기 위해 사용하는 메서드
    // -> Modifiers
    
    // 각각의 Modifier는 새로운 View를 반환한다.
}
// body 프로퍼티는 단일 View만 반환한다.

// 프리뷰를 위한 구조체
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
