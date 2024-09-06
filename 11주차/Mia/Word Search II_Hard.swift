class Solution {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String?
    }
    
    class Trie {
        let root = TrieNode()
        func insert(_ word: String) {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()
        var result = [String]()
        var board = board
        
        
        for word in words {
            trie.insert(word)
        }
        
        func backtrack(_ row: Int, _ col: Int, _ node: TrieNode) {
            let char = board[row][col]
            guard let nextNode = node.children[char] else {
                return
            }
            
            if let word = nextNode.word {
                result.append(word)
                nextNode.word = nil
            }
            
            board[row][col] = "#"
            
            let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            for direction in directions {
                let newRow = row + direction.0
                let newCol = col + direction.1
                
                if newRow >= 0, newRow < board.count, newCol >= 0, newCol < board[0].count {
                    if board[newRow][newCol] != "#" {
                        backtrack(newRow, newCol, nextNode)
                    }
                }
            }
            board[row][col] = char
        }
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if let _ = trie.root.children[board[row][col]] {
                    backtrack(row, col, trie.root)
                }
            }
        }
        
        return result
    }
}