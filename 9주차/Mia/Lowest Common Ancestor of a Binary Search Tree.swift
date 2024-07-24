class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let rootNode = root, let pNode = p, let qNode = q else {return nil}
        switch(p: pNode.val, q: qNode.val){
            case let val where rootNode.val < val.p && rootNode.val < val.q:
                return lowestCommonAncestor(root?.right, p, q)
            case let val where rootNode.val > val.p && rootNode.val > val.q: 
                return lowestCommonAncestor(root?.left, p, q)
            default: 
            return root 
        }
    }
}