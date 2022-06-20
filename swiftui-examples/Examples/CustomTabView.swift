import SwiftUI

struct CustomTabView: View {
    @State var currentTab = 0
    @Namespace var namespace
    var tabItems: [String] = ["white", "blue", "green"]
    
    var body: some View {
        Section(header: VStack(spacing: 0) {
            HStack {
                Spacer()
                tabBarView
                Spacer()
            }
        }.background(.white)) {
            TabView(selection: $currentTab) {
                Color.white
                    .ignoresSafeArea()
                    .tag(0)
                Color.blue
                    .ignoresSafeArea()
                    .tag(1)
                Color.green
                    .ignoresSafeArea()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    var tabBarView: some View {
        HStack {
            ForEach(Array(zip(self.tabItems.indices, self.tabItems)), id: \.0, content: {
                index, name in
                tabItemView(string: name, tab: index)
            })
        }
        .background(.white)
        .frame(height: 48)
    }
    
    
    func tabItemView(string: String, tab: Int) -> some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(string)
                    .foregroundColor(self.currentTab == tab ? .yellow : .black)
                if self.currentTab == tab {
                    Color.yellow.frame(height: 3)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                        .padding(.horizontal, 15)
                } else {
                    Color.clear.frame(height: 3).padding(.horizontal, 15)
                }
            }.animation(.spring(), value: currentTab)
        }
        .buttonStyle(.plain)
    }
}


struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
