class Solution {
    func calculate(_ p : Int, _ q : Int, _ words: inout [String], _ adjList: inout [Character: [Character]], _ inDegrees: inout [Character: Int]) -> Bool{
        let word1 = Array(words[p])
        let word2 = Array(words[q])

        let n = min(word1.count, word2.count)
        let m = max(word1.count, word2.count)
        
        var isFound = false
        for i in 0..<m {
            //MARK: adjList와 inDegrees를 초기화해주는 작업
            if i < n {
                adjList[word1[i], default: []] += []
                inDegrees[word1[i], default: 0] += 0
                adjList[word2[i], default: []] += []
                inDegrees[word2[i], default: 0] += 0
            } else { // n <= i일 때
                if i == n {
                    if !isFound {
                        if word1.count > word2.count {
                            return false
                        }
                    }
                }

                var word = word1
                if word1.count < word2.count {
                    word = word2
                }
                let c = word[i]
                adjList[c, default: []] += []
                inDegrees[c, default: 0] += 0
                continue
            }
            
            //MARK: 더 이상 비교할 수 없음
            if isFound {
                continue
            }
            
            if word1[i] == word2[i] {
                adjList[word1[i], default: []] += []
                inDegrees[word1[i], default: 0] += 0
                continue
            }
            let from = word1[i]
            let to = word2[i]

            if adjList[from, default: []].contains(to) {
                break
            }
            adjList[to, default: []] += []
            adjList[from, default: []].append(to)
            inDegrees[from, default: 0] += 0
            inDegrees[to, default: 0] += 1
            isFound = true
        }

        return true
    }

    func alienOrder(_ words: [String]) -> String {
        if words.count == 0 {
            return ""
        }
        
        if words.count == 1 {
            return String(Array(Set(Array(words[0]))))
        }
        var adjList: [Character: [Character]] = [:]
        var inDegrees: [Character: Int] = [:]

        
        var new_words = words
        for i in 0..<words.count-1 {
            for j in i+1..<words.count {
                let ans = self.calculate(i, j, &new_words, &adjList, &inDegrees)
                if !ans {
                    return ""
                }
            }
        }

        print(adjList)
        print(inDegrees)

        var answer: [Character] = []
        while inDegrees.count != 0 {
            var isFound = false
            for (key, degree) in inDegrees {
                if degree != 0 {
                    continue
                }
                isFound = true
                //MARK: 0인 degree만 뽑아서 삭제하고 answer에 append하기
                answer.append(key)
                inDegrees[key] = nil
                for item in adjList[key, default: []] {
                    inDegrees[item, default: 0] -= 1
                }
            }
            
            if !isFound {
                return ""
            }
        }

        return String(answer)
    }
}
