//
//  listOfCategoriesView.swift
//  SecondHand3
//
//  Created by Benjamin Szakal on 03/11/22.
//
import Nuke
import NukeUI
import SwiftUI

struct listOfCategoriesView: View {
    
    @StateObject var categoriesVM = CategoriesVM()
    
    weak var delegate: GetAnnounceCoordinator?
    
    var body: some View {
        
            VStack(alignment:.leading, spacing: 8){
                
                Text("Top Categories")
                    .foregroundColor(.primary)
                    .font(.title)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(categoriesVM.categories){ cat in
                            Button {
                                delegate?.ShowFilteredAnnounces(searchText: "", category: cat.Name, minPrice: 0.0, maxPrice: 1000.0, noOlderThanDate: nil)
                            } label: {
                                ZStack(alignment:.bottomLeading){
                                    
                                    photoView2(imageUrlsString: [cat.Image])
                                        .frame(width: 200, height: 150)
                                    
                                    Text(cat.Name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                
            }
            .padding(.leading)
        
        .onAppear{
            categoriesVM.getCategories()
        }
        
    }
}

struct listOfCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        listOfCategoriesView()
    }
}
