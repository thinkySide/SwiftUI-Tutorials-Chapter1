//
//  LandmarkList.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI

struct LandmarkList: View {
    
    var body: some View {
        
        // MARK: - [첫번째 방법] List 생성 : KeyPath 이용 방법
        
        // \Landmark.id -> KeyPath
        // 주로 바인딩을 위해서 사용됨.
        // 속성에 대한 참조를 해 속성의 값을 가져옴.
        
        // landmarks 배열을 돌며 생성
        // id가 있어야함.(Unique 해야 한다는 의미)
        
        // List(landmarks, id: \Landmark.id) { landmark in
        //    LandmarkRow(landmark: landmark)
        // }
        
        
        // MARK: - [두번째 방법] : Identifier 프로토콜 준수
        
        // 따로 KeyPath(id)를 작성하지 않아줘도 됨.
        // (이미 Unique한 값이라는 context가 있기 때문)
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    // Destination
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks") // List에다가 달아줘야함!
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
