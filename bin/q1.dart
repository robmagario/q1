class adjacent{
  int u;
  int v;
  adjacent({required this.u, required this.v});
}

void main() {
  var adjList = <adjacent>[];
  var shortestPathList = [];
// add edge from u to v
  addEdge(u,v)
  {
    adjList.add(adjacent(u: u, v: v));
  }

  printAllPathsUtil(u,d,isVisited,localPathList) {
    if (u == (d)) {
      print(localPathList);

      if (shortestPathList.isEmpty) {
        shortestPathList = [...localPathList];
      }
      else if (localPathList.length < shortestPathList.length) {
        shortestPathList = [...localPathList];
      }

      var temp = localPathList[0];
      localPathList.clear();
      localPathList.add(temp);
      // if match found then no need to
      // traverse more till depth
      return;

    }

    // Mark the current node
    isVisited[u] = true;

    // Recur for all the vertices
    // adjacent to current vertex
    for (var i = 0; i < adjList.length; i++) {
        if ((adjList[i].u==u)&&(isVisited[adjList[i].v]==false)) {
          localPathList.add(adjList[i].v);
          printAllPathsUtil(adjList[i].v, d, isVisited, localPathList);
      }
    }

    // Mark the current node
    isVisited[u] = false;
  }

// Prints all paths from
  // 's' to 'd'

  printAllPaths(s,d)
  {
    var isVisited = new List.filled(100, false, growable: false);
    var pathList = [];

    // add source to path[]
    pathList.add(s);

    // Call recursive utility
    printAllPathsUtil(s, d, isVisited, pathList);
  }


  //graph(4);
  addEdge(0, 1);
  addEdge(0, 2);
  addEdge(0, 3);
  addEdge(2, 0);
  addEdge(2, 1);
  addEdge(1, 3);

// arbitrary source
  var s = 2;

// arbitrary destination
  var d = 3;

  print(
      "Following are all different paths from "
          + s.toString() + " to " + d.toString() );
  printAllPaths(s, d);

  print(
      "Following is the shortest path from "
          + s.toString() + " to " + d.toString() );

  print (shortestPathList);
}