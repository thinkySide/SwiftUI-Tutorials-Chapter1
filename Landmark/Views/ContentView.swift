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
        VStack {
            MapView()
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            // height 파라미터만 지정해주면, 뷰가 자동으로
            // 콘텐츠 너비에 맞게 width 사이즈를 잡아줌.
            
            CircleImage()
                .offset(y: -190)
                .padding(.bottom, -190)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    
                    Spacer()
                    // Spacer의 특징
                    // 1. 다른 콘텐츠에 의해서만 크기가 정의됨.
                    // 2. 상위 뷰의 모든 공간을 사용하도록 확장됨.
                    
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                // Stack에 Modifier를 적용시키면 그 안에 있는 모든 요소에 적용됨.
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Desciptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
        
        // SwiftUI View를 커스터마이징 하기 위해 사용하는 메서드
        // -> Modifiers
        
        // 각각의 Modifier는 새로운 View를 반환한다.
    }
}
// body 프로퍼티는 단일 View만 반환한다.

// 프리뷰를 위한 구조체
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
