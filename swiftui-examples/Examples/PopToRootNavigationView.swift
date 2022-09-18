import SwiftUI

struct PopToRootNavigationView: View {
    var body: some View {
        NavigationLink {
            NavigationB()
        } label: {
            Text("Go to NavigationB")
        }.navigationBarTitle("NavigationA")
    }
}

struct NavigationB: View {
    var body: some View {
        NavigationLink {
            NavigationC()
        } label: {
            Text("Go to NavigationC")
        }.navigationBarTitle("NavigationB")
    }
}

struct NavigationC: View {
    var body: some View {
        NavigationLink {
            NavigationD()
        } label: {
            Text("Go to NavigationD")
        }.navigationBarTitle("NavigationC")
    }
}

struct NavigationD: View {
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    
    var body: some View {
        Button {
            self.rootPresentationMode.wrappedValue.dismiss()
        } label: {
            Text("Pop to Root View")
        }.navigationBarTitle("NavigationD")
    }
}

struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

typealias RootPresentationMode = Bool

extension RootPresentationMode {
    
    public mutating func dismiss() {
        self.toggle()
    }
}
