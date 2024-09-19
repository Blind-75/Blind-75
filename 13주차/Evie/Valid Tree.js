class Solution {
    /**
     * @param {number} n
     * @param {number[][]} edges
     * @returns {boolean}
     */
    validTree(n, edges) {
        // 엣지의 개수가 맞지 않으면 트리 조건이 성립하지 않음
        if (edges.length !== n - 1) {
            return false;
        }
        // 그래프 배열 안에 연결된 노드의 쌍을 배열로 저장
        const graph = Array.from({ length: n }, () => []);
        for (let [u, v] of edges) {
            graph[u].push(v);
            graph[v].push(u);
        }
        // 모든 노드를 방문했는지 확인
        const visited = new Set();

        const dfs = (node, parent) => {
            // 노드를 하나씩 방문
            visited.add(node);
            // 해당 노드와 연결된 다른 노드를 탐색
            // 이미 방문한 부모노드는 다시 탐색하지 않음
            for (let neighbor of graph[node]) {
                if (neighbor === parent) continue; 
                // 이미 방문한 노드를 다시 방문하게 되면 사이클이 존재하는 것
                if (visited.has(neighbor)) {
                    return false; 
                }
                // 해당 노드와 연결된 노드, 그 노드와 또 연결된 노드를 모두 탐색
                if (!dfs(neighbor, node)) {
                    return false;
                }
            }

            return true;
        };
        // 인덱스 0번부터 마지막까지 다시 한 번 순회
        if (!dfs(0, -1)) {
            return false;
        }
        // 방문한 노드의 개수와 n이 같은지 확인
        return visited.size === n;
    }
}

// 트리인지 확인
// 트리의 특징 : 모든 노드가 연결되어있음, n-1개의 엣지가 있어야 함 (사이클이 없음)
// n-1개여야하는 이유 : n개 (사이클 존재), n-2개 이하 (연결되지 않은 노드가 존재)
// DFS를 사용해 모든 노드를 방문했는지 확인