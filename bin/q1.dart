class adjacent{
  int u;
  int v;
  adjacent({required this.u, required this.v});
}

void main() {
  var  v;
  var adjList = <adjacent>[];
/*
  initAdjList()
  {
    //adjList = List.generate(v, (i) => List.filled(v, 0, growable: false), growable: false);

  }
  */
// A directed graph using
// adjacency list representation
  graph(vertices)
  {
    // initialise vertex count
    v = vertices;

    // initialise adjacency list
    //initAdjList();
  }


// add edge from u to v
  addEdge(u,v)
  {
    adjList.add(adjacent(u: u, v: v));
  }


  printAllPathsUtil(u,d,isVisited,localPathList) {
    if (u == (d)) {
      print(localPathList);
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
  //    print (i);
 //     print ("u = " + adjList[i].u.toString());
  //    print ("i = " + adjList[i].v.toString());
   //   print (isVisited[i]);
    //  if (!isVisited[adjList[u][i]]) {
        if ((adjList[i].u==u)&&(isVisited[adjList[i].v]==false)) {
      localPathList.add(adjList[i].v);
//print (localPathList[i]);
        printAllPathsUtil(adjList[i].v, d, isVisited, localPathList);

        // remove current node
        // in path[]
        //  localPathList.splice(localPathList.indexOf
        //    (adjList[u][i]),1);
      //    localPathList.remove(i);

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

  graph(4);
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


}