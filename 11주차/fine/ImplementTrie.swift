class TrieNode {
    var children: [Character:TrieNode] = [:]
    var isEndOfWord: Bool = false 
}


class Trie {

    private let root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true 
    }
    
    func search(_ word: String) -> Bool {
        var current = root 
        for char in word {
            guard let node = current.children[char] else {
                return false 
            }
            current = node 
        }
        return current.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = root 
        for char in prefix {
            guard let node = current.children[char]{
                return false 
            }
            current = node 
        }
        return true 
    }
}