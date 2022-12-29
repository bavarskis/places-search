//
//  PlaceRowView.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import SwiftUI

struct PlaceRowView: View {
    let place: Place
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            AsyncImage(url: place.categories.first?.icon.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0,
                           maxWidth: 100,
                           minHeight: 100,
                           maxHeight: 100,
                           alignment: .center)
            } placeholder: {
                Text(NSLocalizedString("imageUnavailableTitle", comment: ""))
                    .frame(minWidth: 0,
                           maxWidth: 100,
                           minHeight: 100,
                           maxHeight: 100,
                           alignment: .center)
            }
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(place.name)")
                Text("\(place.location.formattedAddress)")
                    .lineLimit(4)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

