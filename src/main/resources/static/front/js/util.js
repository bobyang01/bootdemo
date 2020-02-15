
function filterSpaceNode(nodes) {
	for (var i = 0; i < nodes.length; i ++) {
		if (nodes[i].nodeType == 3 && /^\s+$/.test(nodes[i].nodeValue)) {
          //得到空白节点之后，移到父节点上，删除子节点
			nodes[i].parentNode.removeChild(nodes[i]);
		}
	}
	return nodes;
}