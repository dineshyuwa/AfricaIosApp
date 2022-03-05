//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Yuwarajalingam Dinesh on 2022-01-22.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal :Animal
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            
            VStack(alignment:.center, spacing: 20){
                
                //1.HERO
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //2.TITLE
                Text(animal.name.uppercased())
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.vertical,8)
                    .background(
                        Color.accentColor
                            .frame(height:6)
                            .offset(y:24)
                    )
                    
                //3.HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                //4.GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
                    
                    InsetGalleryView(animal: animal)
                    
                }//GROUP
                .padding(.horizontal)
                
                //5.FACTS
                Group{
                    HeadingView(headingImage:"questionmark.circle", headingText:"Did you know ?")
                    InsetFactView(animal:animal)
                }
                
                //6.Description
                Group{
                    HeadingView(headingImage:"info.circle", headingText:"All about lion")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //7.MAP
                Group{
                    HeadingView(headingImage: "map", headingText:"National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //8.LINK
                Group{
                    HeadingView(headingImage:"books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                    
                }
                .padding(.horizontal)
                
                
            }//VSTACK
            .navigationTitle("Learn more about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//:SCROLL
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals : [Animal]=Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
