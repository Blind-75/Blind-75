class WordDictionary {
    var root: Node

    init() {
        root = Node()
    }
    
    func addWord(_ word: String) {
        guard !word.isEmpty else { return }
        var characters = Array(word.lowercased())
        var currentNode = root 
        var currentIndex = 0

        while currentIndex < characters.count {
            var character = characters[currentIndex]
            if let child = currentNode.children[character] {
                currentNode = child
                currentIndex += 1
            } else {
                var childNode = Node(parent: currentNode, value: character)
                currentNode.children[character] = childNode

                currentNode = childNode
                currentIndex += 1
            }
        }

        if currentIndex == characters.count{
            currentNode.isTerminating = true
        }
    }
    
    func search(_ word: String) -> Bool {
        var characters = Array(word.lowercased())
        return checkCharacter(currentNode: root, characters: characters, index: 0)
    }
    private func checkCharacter(currentNode: Node, characters: [Character], index: Int) -> Bool {
        var currentNode = currentNode

        for i in index..<characters.count {
            let character = characters[i]
            if character == "." {
                for child in currentNode.children.values {
                    if checkCharacter(currentNode: child, characters: characters, index: i + 1) {
                        return true
                    }
                }
                return false
            } else if let nextNode = currentNode.children[character] {
                currentNode = nextNode
            } else {
                return false
            }
        }

        return currentNode.isTerminating
    }
}

class Node {
    var isTerminating = false 
    var value: Character? 
    var children: [Character: Node] = [:]
    var parent: Node? 

    init(parent: Node? = nil, value: Character? = nil){
        self.parent = parent
        self.value = value
    }

    func addCharacter(character: Character){
        guard self.children[character] == nil else {return}
        var node = Node(parent: self, value: character)
        self.children[character] = node
    }
}