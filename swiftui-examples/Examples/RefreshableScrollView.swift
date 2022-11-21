import SwiftUI

struct RefreshableScrollView: View {
    @State private var isRefreshable = false
    var body: some View {
        CustomScrollView {
            VStack(spacing: 60) {
                if self.isRefreshable {
                    Text("Refreshable").font(.system(size: 25, weight: .bold))
                } else {
                    Text("Text0")
                    Text("Text1")
                    Text("Text2")
                    Text("Text3")
                    Text("Text4")
                    Text("Text5")
                    Text("Text6")
                    Text("Text7")
                    Text("Text8")
                    Text("Text9")
                }
            }.frame(maxWidth: .infinity)
        } refreshable: {
            self.isRefreshable.toggle()
        }
    }
}

public struct CustomScrollView<Content: View>: View {
    var content: Content
    var refreshable: () -> Void

    public init(content: @escaping () -> Content, refreshable: @escaping () -> Void) {
        self.content = content()
        self.refreshable = refreshable
    }

    public var body: some View {
        if #available(iOS 16.0, *) {
            List {
                content
                    .listRowSeparatorTint(.clear)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .scrollContentBackground(.hidden)
            .background(.orange)
            .listStyle(.plain)
            .refreshable {
                refreshable()
            }
        } else {
            List {
                content
                    .listRowSeparatorTint(.clear)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
            .refreshable {
                refreshable()
            }
        }
    }
}

