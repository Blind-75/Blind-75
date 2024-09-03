
class Trie {
    let root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        
        var currentIndex = 0 //of word
        var wordCharacters = Array(word.lowercased())
        var currentNode = root

        while currentIndex < wordCharacters.count{
            var currentCharacter = wordCharacters[currentIndex]
            if let child = currentNode.children[currentCharacter] {
                currentNode = child
            } else { 
                currentNode.addChild(currentCharacter)
                currentNode = currentNode.children[currentCharacter]!
            }
            currentIndex += 1

            if currentIndex == wordCharacters.count {
                currentNode.isTerminating = true
            }
        }
    }
    
    func search(_ word: String) -> Bool {
        var currentIndex = 0 
        var wordCharacters = Array(word.lowercased())
        var currentNode = root 

        while currentIndex < wordCharacters.count, let character = currentNode.children[wordCharacters[currentIndex]]{
            currentNode = character
            currentIndex += 1
        }
        if currentIndex == wordCharacters.count && currentNode.isTerminating{
            return true
        } else {
            return false
        }
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentIndex = 0 
        var wordCharacters = Array(prefix.lowercased())
        var currentNode = root

        while currentIndex < wordCharacters.count, let character = currentNode.children[wordCharacters[currentIndex]]{
            currentNode = character
            currentIndex += 1
        }

        if currentIndex == wordCharacters.count{
            return true
        } else {
            return false
        }
    }
}

class TrieNode {
    var value: Character?
    var isTerminating: Bool = false
    weak var parent: TrieNode?
    var children: [Character: TrieNode] = [:]

    init(value: Character? = nil, parent: TrieNode? = nil){
        self.value = value
        self.parent = parent
    }

    func addChild(_ child: Character) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(value: child, parent: self)
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */