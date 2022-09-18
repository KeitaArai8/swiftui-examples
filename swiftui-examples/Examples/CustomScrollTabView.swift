import SwiftUI

struct CustomScrollTabView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isHiddenNavBar = false
    @State private var currentTab = 0
    @Namespace private var namespace
    
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                ZStack(alignment: .top) {
                    Color.gray
                        .frame(height: 125)
                    VStack {
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.backward")
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                            }) {
                                Image(systemName: "gearshape")
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.top ,40)
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer().frame(width: 16)
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            Button(action: {
                            }) {
                                Text("Button")
                                    .font(.system(size: 15, weight: .bold))
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            
                            Spacer().frame(width: 16)
                        }.padding(.top ,15)
                    }
                    
                }
                
                Spacer().frame(height: 10)
                
                VStack {
                    HStack {
                        Text("Name")
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                    }
                    HStack {
                        Text("Introduction")
                            .font(.system(size: 13))
                        Spacer()
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal, 15)
                
                Section(header: VStack(spacing: 0) {
                    if self.isHiddenNavBar {
                        ZStack(alignment: .top) {
                            Color.gray
                                .frame(height: 90)
                            
                            HStack {
                                Button(action: {
                                    dismiss()
                                }) {
                                    Image(systemName: "chevron.backward")
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                }
                                
                                Spacer()
                                
                                Text("Name")
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Button(action: {
                                }) {
                                    Image(systemName: "gearshape")
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.top, 40)
                            .padding(.horizontal)
                        }.frame(height: 90)
                    }
                    
                    NavigationBarView(currentTab: $currentTab, navigationItems: ["Red", "Blue", "Green"])
                    
                }.background(Color.yellow)) {
                    TabView(selection: $currentTab) {
                        Color.red
                            .tag(0)
                        
                        Color.blue
                            .tag(1)
                        
                        Color.green
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 2000)
                    .background(Color.yellow)
                }
            }
            .background(GeometryReader {
                Color.white.preference(key: ViewOffsetKey.self,
                                       value: -$0.frame(in: .named("scroll")).origin.y)
            })
            .onPreferenceChange(ViewOffsetKey.self) {
                self.isHiddenNavBar = $0 > 300.0
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct NavigationBarView: View {
    @Binding var currentTab: Int
    @Namespace private var namespace
    var navigationItems: [String]
    
    var body: some View {
        HStack {
            ForEach(Array(zip(self.navigationItems.indices, self.navigationItems)), id: \.0, content: {
                index, name in
                navBarItem(string: name, tab: index)
            })
        }
        .background(.white)
        .frame(height: 48)
    }
    
    func navBarItem(string: String, tab: Int) -> some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(string)
                    .font(.system(size: 13))
                    .foregroundColor(self.currentTab == tab ? Color.primary : Color.black)
                if self.currentTab == tab {
                    Color.primary.frame(height: 3)
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

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
