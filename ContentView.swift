import SwiftUI

struct ContentView: View {
    let pageCount = 8
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            // Horizontal Scrollable Banners with Paging
            TabView(selection: $selectedIndex) {
                ForEach(0..<pageCount, id: \.self) { index in
                    ZStack {
                        // Banner Background
                        Color.blue
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        
                        // Banner Content
                        Text("Banner \(index + 1)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .tag(index)
                }
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .animation(.easeInOut, value: selectedIndex)
            
            Divider()
                .padding(.vertical, 10)
            
            // Information View corresponding to the selected banner
            TabView(selection: $selectedIndex) {
                ForEach(0..<pageCount, id: \.self) { index in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Information for Banner \(index + 1)")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("""
                                This is the detailed information for Banner \(index + 1). You can add more content here, such as descriptions, images, or any other relevant information that corresponds to the selected banner. Scroll horizontally or vertically to navigate through different banners and their respective information.
                                """)
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            // Add more content as needed
                            
                            Spacer()
                        }
                        .padding()
                        .tag(index)
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: selectedIndex)
        }
        .onChange(of: selectedIndex) { newValue in
            // Additional actions when selectedIndex changes, if needed
            // For example, logging or triggering other UI updates
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
