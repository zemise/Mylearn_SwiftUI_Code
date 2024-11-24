import Foundation

func test() {
    print("this is a test")
}

func test4(name: String...) {
    for n in name {
        print(n)

    }
}

test4(name: "1", "2", "3")
