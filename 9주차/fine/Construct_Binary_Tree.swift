public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


// 전위 순회 : 루트 -> 왼쪽 서브트리 -> 오른쪽 서브트리 
// 중위 순회 : 왼쪽 서브트리 -> 루트 -> 오른쪽 서브트리 
// 전위 순회 첫번째 노드는 루트 노드 

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
    }
    
    private func buildTreeHelper(_ preorder: [Int], _ preStart: Int, _ preEnd: Int,
         _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd {
            return nil 
        }

        let rootVal = preorder(preStart)
        let root = TreeNode(rootVal)

        let rootIndexInorder = inorder.firstIndex(of: rootVal)!
        let leftSubtreeSize = rootIndexInorder - inStart 

        
        root.left = buildTreeHelper(preorder, preStart + 1, preStart + leftSubtreeSize,
                                    inorder, inStart, rootIndexInorder - 1)
        
        root.right = buildTreeHelper(preorder, preStart + leftSubtreeSize + 1, preEnd,
                                     inorder, rootIndexInorder + 1, inEnd)
        
        return root
    }
}