
#if swift(>=2.2) && !swift(>=3.0)
    public typealias Collection = CollectionType
    public protocol MutableCollection: MutableCollectionType {
        associatedtype IndexDistance
    }
    extension Array : MutableCollection {
        public typealias IndexDistance = Int
    }
#endif

public extension Collection {
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}

public extension MutableCollection where Index == Int, IndexDistance == Int {
    mutating func shuffle() {
        guard count > 1 else { return }
        
        for i in 0..<count - 1 {
            let j = random(count - i) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}


