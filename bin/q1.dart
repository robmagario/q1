// class for adjacent pairs
class adjacent{
  int u;
  int v;
  adjacent({required this.u, required this.v});
}

void main() {
  var adjList = <adjacent>[];
  var shortestPathList = [];

  // function to convert from letter to number since all internal calculations are done with integers
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

  // function to convert numbers back to letters for the nodes
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
      print (listConverter(localPathList).toString());
      if (shortestPathList.isEmpty) {
        shortestPathList = [...localPathList];
      }
      else if (localPathList.length < shortestPathList.length) {
        shortestPathList = [...localPathList];
      }

      // if match found then no need to
      // traverse more till depth
      return;
    }

    // Mark the current node
    isVisited[u] = true;

    // Recursive for all the vertices
    // adjacent to current vertex
    for (var i = 0; i < adjList.length; i++) {
        if ((adjList[i].u==u)&&(isVisited[adjList[i].v]==false)) {
          localPathList.add(adjList[i].v);
          printAllPathsUtil(adjList[i].v, d, isVisited, localPathList);
          // remove the current mode
          localPathList.remove(adjList[i].v);
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

  addEdge('A', 'B');
  addEdge('A', 'D');
  addEdge('A', 'H');
  addEdge('B', 'C');
  addEdge('B', 'D');
  addEdge('B', 'D');
  addEdge('C', 'D');
  addEdge('C', 'F');
  addEdge('D', 'E');
  addEdge('E', 'H');
  addEdge('F', 'G');
  addEdge('G', 'H');

// arbitrary source
  var s = 'A';

// arbitrary destination
  var d = 'H';

  print(
      "Following are all different paths from "
          + s.toString() + " to " + d.toString() );
  printAllPaths(s, d);

  print(
      "Following is the shortest path from "
          + s.toString() + " to " + d.toString() );

  print (listConverter(shortestPathList));
}