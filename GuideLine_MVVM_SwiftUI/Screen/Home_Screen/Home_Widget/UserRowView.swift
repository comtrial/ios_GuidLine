//
//  RandomUserRowView.swift
//  ios_tutorial_api
//
//  Created by 최승원 on 2021/07/06.
//

import Foundation
import SwiftUI
import URLImage

struct UserRowView : View {
    var feed: Feed
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    init(_ feed: Feed) {
        self.feed = feed
        
    }
    
    var body : some View{
        
            VStack(alignment: .leading){
                //MARK - Profile
                
                var imageUrlex = URL(string: feed.feedImage[0].image)
                
                
                HStack{
                    //View에 전달해야 하는 변수를 등록하여 사용
                    ProfileImgView(imageUrl: imageUrlex! )
                    
                    Text("\(feed.username)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 14))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        //.minimumScaleFactor(0.5)
                        // lineLimit 두줄 넘어갈 경우 scale 줄어드는 정도 control
                }// Hstack에 대한 frame을 줘서 profilwimgView 사이즈 컨트롤
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 36, alignment: . leading)
                .padding(.vertical)
                
                
                //MARK - Feed Content
                VStack(alignment: .leading){
                    Text(feed.title)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                        .lineLimit(3)
                    Text(feed.content)
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .lineLimit(3)
                }
                
                
                
                //MARK - Feed Img
                
                URLImage(imageUrlex!,
                             content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                             })
                    .frame(minWidth: screenSize.width - 60, idealWidth: screenSize.width - 60, maxWidth: screenSize.width - 60, minHeight: 0, idealHeight: screenSize.width - 60, maxHeight: .infinity, alignment: .leading)
                    .cornerRadius(12)
            
  
                    
            }//VstackView
            .frame(minHeight: 250)
            .padding(8)
            //.background(Color.init(.systemGray6))
            .cornerRadius(16)
        
        }// NavigationView

    }


