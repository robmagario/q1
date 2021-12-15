class adjacent{
  int u;
  int v;
  adjacent({required this.u, required this.v});
}

void main() {
  var adjList = <adjacent>[];
  var shortestPathList = [];

  int letterConverter (String val) {
    switch(val) {
      case 'A': return 0;
      case 'B': return 1;
      case 'C': return 2;
      case 'D': return 3;
      case 'E': return 4;
      case 'F': return 5;
      case 'G': return 6;
      case 'H': return 7;
    }
    return 99;
  }

  List listConverter (List listValue) {
    var result = [];
    for (var x=0; x < listValue.length; x++) {
      switch (listValue[x]) {
        case 0 : result.add('A'); break;
        case 1 : result.add('B'); break;
        case 2 : result.add('C'); break;
        case 3 : result.add('D'); break;
        case 4 : result.add('E'); break;
        case 5 : result.add('F'); break;
        case 6 : result.add('G'); break;
        case 7 : result.add('H'); break;
      }
    }
    return result;
  }

// add edge from u to v
  addEdge(uLetter,vLetter)
  {
    var u = letterConverter(uLetter);
    var v = letterConverter(vLetter);
    adjList.add(adjacent(u: u, v: v));
  }

  printAllPathsUtil(u,d,isVisited,localPathList) {
    if (u == (d)) {
     // print(localPathList);
      print (listConverter(localPathList).toString());
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

  printAllPaths(sLetter,dLetter)
  {
    var s = letterConverter(sLetter);
    var d = letterConverter(dLetter);

    var isVisited = new List.filled(100, false, growable: false);
    var pathList = [];

    // add source to path[]
    pathList.add(s);

    // Call recursive utility
    printAllPathsUtil(s, d, isVisited, pathList);
  }


  //graph(4);
  addEdge('A', 'B');
  addEdge('A', 'C');
  addEdge('A', 'D');
  addEdge('C', 'A');
  addEdge('C', 'B');
  addEdge('B', 'D');

// arbitrary source
  var s = 'C';

// arbitrary destination
  var d = 'D';

  print(
      "Following are all different paths from "
          + s.toString() + " to " + d.toString() );
  printAllPaths(s, d);

  print(
      "Following is the shortest path from "
          + s.toString() + " to " + d.toString() );

  print (shortestPathList);
}