import SwiftUI

extension View {
    func viewSize(onChange: @escaping (CGSize) -> Void) -> some View {
        self
            .background() {
                GeometryReader { proxy in
                    Path { path in
                        DispatchQueue.main.async {
                            onChange(proxy.size)
                        }
                    }
                }
            }
    }
}
