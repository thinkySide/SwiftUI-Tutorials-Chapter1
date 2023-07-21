//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by 김민준 on 2023/07/21.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            // height 파라미터만 지정해주면, 뷰가 자동으로
            // 콘텐츠 너비에 맞게 width 사이즈를 잡아줌.
            
            CircleImage(image: landmark.image)
                .offset(y: -190)
                .padding(.bottom, -190)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    
                    Spacer()
                    // Spacer의 특징
                    // 1. 다른 콘텐츠에 의해서만 크기가 정의됨.
                    // 2. 상위 뷰의 모든 공간을 사용하도록 확장됨.
                    
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                // Stack에 Modifier를 적용시키면 그 안에 있는 모든 요소에 적용됨.
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
        // Navigation 관련 코드는 Navigation Stack이 쌓일 때만 확인 가능하다.
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
