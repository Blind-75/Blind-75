/* 트라이(Trie) : 문자열 검색과 저장을 효율적으로 하기 위해 사용되는 트리 구조로 특히 여러 문자열 중에서 특정 패턴이나 접두사를 빠르게 찾을 수 있음
주요 활용처 : 사전 검색, 자동 완성 검색

트라이의 주요 개념
노드(Node): 각 노드는 하나의 문자(character)를 저장하며, 트라이의 루트는 비어 있습니다.
간선(Edge): 노드 간에는 문자들이 연결되며, 이는 트리의 경로를 형성합니다.
루트 노드(Root Node): 트라이의 시작점이며, 빈 노드로 시작합니다.
자식 노드(Child Nodes): 루트 노드에서 하위로 문자들이 연결되며, 각 문자에 대해 새로운 자식 노드를 만듭니다.
문자열의 끝 표시(End of Word): 문자열이 끝나는 위치에 표시를 추가해, 해당 경로가 문자열의 끝임을 나타냅니다.

트라이의 특징
시간 복잡도: 트라이에서 문자열을 검색하거나 삽입하는 시간 복잡도는 **O(L)**입니다. 여기서 L은 문자열의 길이를 의미합니다. 이는 검색이나 삽입이 문자열의 길이에 비례해 빠르게 처리된다는 뜻입니다.
공간 복잡도: 트라이의 공간 복잡도는 삽입되는 문자열의 길이와 개수에 따라 다릅니다. 하지만 중복되는 부분이 있으면 저장 공간을 절약할 수 있습니다.
 
트라이의 주요 기능
삽입(Insertion): 문자열의 각 문자를 차례대로 트리의 노드로 삽입합니다.
검색(Search): 트리의 경로를 따라가며 해당 문자열이 존재하는지 확인합니다.
접두사 검색(Prefix Search): 특정 문자열로 시작하는 모든 문자열을 빠르게 찾을 수 있습니다.
 */

// 각 노드를 표현
class TrieNode {
    // 현재 노드에서 연결된 다음 문자열을 자식 노드로 가짐
    var children: [Character: TrieNode] = [:]
    // 특정 노드가 단어의 끝인지 판별
    var isEndOfWord: Bool = false
}

class Trie {
    private var root: TrieNode
    init() {
        root = TrieNode()
    }
    // word를 Trie에 삽입
    // 각 문자가 트리의 경로에 없다면 새로운 노드를 생성 추가
    // 마지막 노드에서 isEndOfWord를 true로 설정하여 단어의 끝을 표시
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isEndOfWord = true
    }
    // word가 Trie에 있는지 확인
    // 트리 경로를 따라가며 노드를 확인하고, 마지막 노드에서 isEndOfWord가 true인지 확인
    func search(_ word: String) -> Bool {
        var node = root
        for char in word {
            guard let nextNode = node.children[char] else {
                return false
            }
            node = nextNode
        }
        return node.isEndOfWord
    }
    // 주어진 prefix로 시작하는 단어가 있는지 확인
    // search와 비슷하지만, 접두사만 일치하면 됨
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for char in prefix {
            guard let nextNode = node.children[char] else {
                return false
            }
            node = nextNode
        }
        return true
    }
}
