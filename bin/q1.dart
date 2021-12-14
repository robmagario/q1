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
      // if match found then no need to
      // traverse more till depth
      return;
    }

    // Mark the current node
    isVisited[u] = true;

    // Recur for all the vertices
    // adjacent to current vertex
    for (var i = 0; i < adjList.length; i++) {
    //  if (!isVisited[adjList[u][i]]) {
        if ((adjList[i].u==u)&&(!isVisited.contains(adjList[i].v))) {
      localPathList.add(adjList[i].v);
        printAllPathsUtil(adjList[i], d,
            isVisited, localPathList);

        // remove current node
        // in path[]
        //  localPathList.splice(localPathList.indexOf
        //    (adjList[u][i]),1);
      }
    }

    // Mark the current node
    isVisited[u] = false;
  }
  

// Prints all paths from
  // 's' to 'd'

  printAllPaths(s,d)
  {
    var isVisited = new List.filled(v, false, growable: false);
    for(var i=0;i<v;i++)
      isVisited[i]=false;
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
 // print (adjList[0].u.toString() + " " + adjList[0].v.toString());
 // print (adjList[1].u.toString() + " " + adjList[1].v.toString());
 // print (adjList[2].u.toString() + " " + adjList[2].v.toString());

}