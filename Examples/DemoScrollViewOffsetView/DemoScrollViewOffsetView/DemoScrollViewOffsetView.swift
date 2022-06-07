import SwiftUI

struct DemoScrollViewOffsetView: View {
    @State private var offset = CGFloat.zero
    @State var isPresented = false
    var body: some View {
        
        Text("Stop Scroll!!")
            .frame(maxWidth: .infinity, minHeight: 70)
            .background(.red)
            .opacity(isPresented ? 1 : 0)
        
        ScrollView {
            VStack {
                ForEach(0..<100) { i in
                    Text("Item \(i)").padding()
                }
            }.background(GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    offset = -proxy.frame(in: .named("scroll")).origin.y
                    print("offset >> \(offset)")
                    isPresented = offset > 300.0 ? true : false
                }
                return Color.clear
            })
        }.coordinateSpace(name: "scroll")
    }
}

struct DemoScrollViewOffsetView_Previews: PreviewProvider {
    static var previews: some View {
        DemoScrollViewOffsetView()
    }
}
