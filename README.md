# SwiftUI入门

## 一、视图和调整器

### 1.1 SwiftUI架构

```swift
import SwiftUI

@main
struct FoodPickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

如上，架构主体为：**App—Scene—View**

### 1.2 Scene

- WindowGroup

- DocumentGroup 

- Setting

```swift
var body: some Scene {
  WindowGroup {
    ContentView()
  }
  # if os(macOs)
  Setting{
    SettingView()
  }
  # end if
}
```

### 1.3 View

- 在 body 属性中描述画面长什么样子

- body的类型必须遵守View protocol

对于View而言来实际操作等于以下3个步骤：

1. 有什么View可以用，即View。
2. View可以如何改变，即Modifier。
3. 如何组合和排序多个View，即Layout。

```swift
struct ContentView: View {
    var body: some View {
        VStack { // layout
            Image(systemName: "globe") // View
                .imageScale(.large) // Modifier
                .foregroundColor(.accentColor)
            Text("Hello, Baby!")
        }
        .padding()
    }
}
```

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Image(systemName: "globe")
                .imageScale(.large) // 这个调整器只对系统icon有效
                .foregroundColor(.accentColor)

            Text("今天吃什么？")
                .font(.largeTitle)
                .bold()
        }
        .padding()
    }
}
```

示例

```swift
import SwiftUI

struct ContentView: View {
    let food = ["汉堡", "沙拉", "披萨"]
    @State private var selectedFood: String?

    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("今天吃什么？")
                .bold()

            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }

            Button(role: .none) {
                selectedFood = food.shuffled().first
            } label: {
                Text(selectedFood == .none ? "告诉我！" : "换一个")
                    .frame(width: 200) // 提供空间
            }.padding(.bottom, -15)

            Button(role: .destructive) {
                selectedFood = .none
            } label: {
                Text("重置")
                    .frame(width: 200)
            }.buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.secondary)
        .font(.title2)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 1), value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

决定动画的流程

```
.animation(动画曲线，观察的值)
```

对于观察的值：如果侦测到变换---确认受到影响的View---**变化前后是同一个View吗？**

- Yes ----变形
  - 同一个View在变化
    - 调整器的内容改变
    - 启动的内容改变
  - 预设
    - 大部分和<u>数字</u>有关的调整器都可以流畅的变形
    - 遇到不会的变形时，会淡入淡出(⚠️iOS16之前还是直接切换的)
- No----转场
  - 不同View之间的变化
    - A画面<->B画面
    - 有画面<->没画面
  - 预设
    - 预设淡入淡出。
    - 可通过调整器修改转场风格。

View的身份

- View是Struct，所以需要定义如何判断View之间的关联性。
- 两个步骤确认身份：
  - 先判断<u>结构位置</u>、再判断<u>ID</u>

示例：

- 以下代码外层如果再包一层动画，不强制为不同的View的话可能没有自己想要的效果

- if之内，以及没有写出的else部分(相当于有个EmptyView)，会建立两个独立的不同画面，搞混的话，会弄成非预期的动画

```swift
if selectedFood != .none {
  Text(selectedFood ?? "")
  .font(.largeTitle)
  .bold()
  .foregroundColor(.green)
  .id(selectedFood) // 强制为不同的View，要的就是转场的效果
  .transition(.asymmetric(
    insertion: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2)),
    removal: .opacity.animation(.easeOut(duration: 0.4))))
}
```

一个明显的示例对比如下:

- 第一个，会被认为两个独立的View，从而在产生变化的时候就会用转场的特效
- 第二个，为条件运算子，运算出一个View

```swift
// 1
if selectedFood != .none {
  Color.pink
}else {
  Color.blue
}

// 2
selectedFood != .none ? Color.pink : Color.blue
```



额外补充：关于some View

```swift
import SwiftUI

// 类型 SwiftUI.Text
let text: Text = .init("Hello")
// 类型 SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI._PaddingLayout>
let text2: SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI._PaddingLayout> = Text("Hello").padding() as! ModifiedContent<SwiftUI.Text, SwiftUI._PaddingLayout>

// 类型 SwiftUI.ModifiedContent<SwiftUI.ModifiedContent<SwiftUI.Text, SwiftUI._PaddingLayout>, SwiftUI._EnvironmentKeyWritingModifier<Optional<SwiftUI.Color>>>
let view = text2.foregroundColor(.pink)

// 从以上看出View的类型实际被写出时，比较麻烦，以some View表示让内部自己处理
// 每一种不透明的类型，只会是一种固定的结果，一种固定的类型


let useDarkMode = false
// 返回的是同一种类型
let background: some View = useDarkMode ? Color.black : Color.white

// 以下返回的不是同一种类型，所以用了any View表示，但是这个就不能被放入some View里了
let background2: any View = useDarkMode ? Text("不支持深色模式") : Color.white

```

### 1.4 调整器 Modifier

- 有的只对套用的那一个View做改变，有的会改变所有包含在里面的View。

- 有些调整器会叠加，有些只会套用第一个（不会被覆盖）。

- 大部分的调整器都是在View的extension中，使用后会返回一个新的view。

- 调整器的位置很重要。

  

View的排版过程

1. 上层画面告诉下层画面自己有多少空间，并询问下层需要多少空间。
2. 下层画面回应自己想要的大小。它**可以选择任何大小**，不一定要配合上层所提供的大小决定。(也就是大小由下层决定)
3. 上层画面根据收集到的所有大小，根据自己的排版规则来**决定下层画面的位置**在哪。(也就是位置由上层决定)



## 二、排版练习