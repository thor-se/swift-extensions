## .viewSize extension for SwiftUI

This extension determines the geometry of a View and allows you to handle its size. This makes it possible to use the dimensions of a View somewhere else in its parent View.

## Usage

```swift
struct HelloWorldView: View {
    @State var textSize: CGSize?
    
    var body: some View {
        Text("Hello, World!")
            .viewSize { size in
                self.textSize = size
            }
    }
}
```

## Source code

```swift
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
```