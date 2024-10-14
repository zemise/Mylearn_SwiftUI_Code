import UIKit

var greeting = "Hello, playground"

print("\n(类型Check）===================================================")

class RichMan {
    func doPlay() {
        print("Do Play")
    }
}

class Tom: RichMan {}

class Jim: RichMan {}

func richManPlay(man: RichMan?) {
    guard let person = man else {
        print("No parameter")

        return
    }

    if person is Tom {
        print("Tom ")
    }

    if person is Jim {
        print("Jim")
    }

    person.doPlay()
}

let richman = RichMan()

richManPlay(man: richman)

let tom = Tom()
richManPlay(man: tom)

func richManPlayByIf(man: RichMan?) {
    if let person = man {
        if person is Tom {
            print("Tom ")
        }

        if person is Jim {
            print("Jim")
        }

        person.doPlay()
    } else {
        print("No parameter")
    }
}

richManPlayByIf(man: nil)

func richManPlayByAs(man: RichMan) {
    var personTom = man as? Tom

    if personTom != nil {
        print("Tom")
    }

    var personJim = man as? Jim

    if personJim != nil {
        print("Jim")
    }

    man.doPlay()
}

richManPlayByAs(man: tom)
