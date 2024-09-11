

class TrieNode {
    let value: Character? // Empty Character를 표현하기 위해서 optional으로 타입을 설정함
    var child: [Character: TrieNode]
    var isWord: Bool

    init(_ inputValue: Character? = nil) {
        self.value = inputValue
        self.child = [:]
        self.isWord = false
    }
}

class Trie {
    let root: TrieNode

    init() {
        self.root = TrieNode()
    }

    func insert(_ word: String) {
        var currNode: TrieNode = self.root
        for c in word {
            if !currNode.child.contains(where: { $0.key == c }) {
                currNode.child[c] = TrieNode(c)
            }
            currNode = currNode.child[c]!
        }
        currNode.isWord = true
    }

    func search(_ word: String) -> Bool {
        var currNode = self.root
        for c in word {
            if !currNode.child.contains(where: { $0.key == c }) {
                return false
            }
            currNode = currNode.child[c]!
        }
        return currNode.isWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var currNode = self.root
        for c in prefix {
            if !currNode.child.contains(where: { $0.key == c }) {
                return false
            }
            currNode = currNode.child[c]!
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
