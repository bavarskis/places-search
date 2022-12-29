//
//  PlacesView.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import SwiftUI

struct PlacesView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text(viewModel.sliderText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    
                    Slider(value: $viewModel.rangeInMeters, in: viewModel.minRangeLimitInMeters...viewModel.maxRangeLimitInMeters) { editing in
                        if !editing {
                            Task {
                                await viewModel.fetchPlaces()
                            }
                        }
                    }
                    .padding(20)
                    
                    List(viewModel.places) { place in
                        PlaceRowView(place: place)
                    }
                    .scrollContentBackground(.hidden)
                }
                
                if viewModel.isFetchingData {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .padding()
                        .background(.black)
                        .cornerRadius(10)
                }
            }
            .navigationTitle(viewModel.title)
        }
        .task {
            await viewModel.fetchPlaces()
        }
        .alert(viewModel.genericErrorMessage, isPresented: $viewModel.isShowingError) {
            Button(viewModel.okTitle, role: .cancel) { }
        }
    }
}
