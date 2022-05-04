//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 1/05/22.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    @State private var filterSelected = FilterOption.default
    
    enum FilterOption: String, CaseIterable {
        case `default`, alphabetical, countries
    }
    
    var body: some View {
        NavigationView {
            List(filteredBySearchText) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 0.5)
                            }
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Menu {
                    Picker("Select a filter option", selection: $filterSelected) {
                        ForEach(FilterOption.allCases, id: \.self) {
                            Text($0.rawValue.capitalized).tag($0)
                        }
                    }
                } label: {
                    switch filterSelected {
                    case .default:
                        Image(systemName: "list.bullet")
                    case .alphabetical:
                        Text("Abc")
                    case .countries:
                        Image(systemName: "globe.americas.fill")
                    }
                }
            }
            WelcomeView()
        }
        .environmentObject(favorites)
        //.phoneOnlyNavigationView()
    }
    
    private var filterdByOptions: [Resort] {
        switch filterSelected {
        case .default:
            return resorts
        case .alphabetical:
            return resorts.sorted { $0.name < $1.name }
        case .countries:
            return resorts.sorted { $0.country < $1.country }
        }
    }
    
    private var filteredBySearchText: [Resort] {
        if searchText == "" {
            return filterdByOptions
        } else {
            return filterdByOptions.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
