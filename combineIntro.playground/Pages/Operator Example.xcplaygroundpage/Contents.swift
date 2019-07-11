import Foundation
import Combine


class FoodTaster {
    var mood = "" {
        didSet {
            print("ohh that makes me \(mood)")
        }
    }
}


struct Cheese {
    let name: String
    let odorIntensity: Double
}


let taster = FoodTaster()
let cheddar = Cheese(name: "Cheddar", odorIntensity: 0.1)
let gorgonzola = Cheese(name: "Gorgonzola", odorIntensity: 0.6)
let rustique = Cheese(name: "Le Rustique", odorIntensity: 0.9)



extension Notification.Name {
    static let cheeseServed = Notification.Name("cheeseServed")
}
/*:
 # Operator
 ### transform upstream: notification
 ### and provide downstream: mood for subscription
 */
let moodSubscription = NotificationCenter.default.publisher(for: .cheeseServed)
    .compactMap { notification in
        guard let cheese = notification.object as? Cheese else { return nil }
        switch cheese.odorIntensity {
        case ..<0.3:
            return "pleasant"
        case ..<0.7:
            return "uneasy"
        default:
            return "🤢"
        }
    }
    .filter { $0 != "🤢" }
    .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
            taster.mood = "wanna go home"
        case .failure(let f):
            print("will never happen. \(f)")
        }
    }, receiveValue: { mood in
        taster.mood = mood
    })

NotificationCenter.default.post(name: .cheeseServed, object: cheddar)
NotificationCenter.default.post(name: .cheeseServed, object: rustique)
NotificationCenter.default.post(name: .cheeseServed, object: gorgonzola)
moodSubscription.receive(completion: .finished)
moodSubscription.cancel()
/*:
 ---
 # More operators
 ![patterns](combine_operators.pdf)
 Source: [Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)
 */
//: [⬅️ Back](@previous)    [Next ➡️](@next)
