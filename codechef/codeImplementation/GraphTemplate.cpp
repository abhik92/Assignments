/*
 * Author : Karthik Abinav
 */

#include <vector>
#include <list>
#include <map>
#include <set>
#include <deque>
#include <stack>
#include <queue>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cctype>
#include <string>
#include <climits>
#include <cassert>
#include <string.h>
#include <stdint.h>
#include <unistd.h>

/*Numeric Constants*/
#define INF 1000000000
#define MAX 500
#define mod 1000007

#define for_inc(start,end,increment)for(i=start;i<end;i+=increment)
#define for_dec(start,end,decrement)for(i=start;i>end;i-=decrement)

#define inp_d(n)scanf("%d",&n)
#define inp_ld(n)scanf("%ld",&n)
#define inp_lld(n)scanf("%lld",&n)
#define inp_s(n)scanf("%s",n)
#define inp_c(n)scanf("%c",&n)

#define out_d(n)printf("%d",n)
#define out_ld(n)printf("%ld",n)
#define out_lld(n)printf("%lld",n)
#define out_s(n)printf("%s",n)
#define out_c(n)printf("%c",n)
#define out_nl()printf("\n");

#define v_size(A) ((int)(A.size()))
#define set(A,x) memset(A,x,sizeof(A));  
#define pb push_back
#define mp make_pair
#define ll long long
#define ld long


using namespace std;

// Graph specific headers
#define edge pair<int,int>
#define MAX_VER 100

class Graph
{
    public:
        void init(int type); //type = 0 adjacency list ; type = 1 adjacency matrix
        void reset();
        void BFS();
        void DFS();
        void kruskal(); //MST
        void dijkstra(); //Shortest Path
        void floydWarshall(); //All Pairs shortest Path
        void Dinitz(); //Max Flow -- Prefered
        void FordFulkerson(); //Max FLow
        void hopcroftKarp(); //Maximum Matching in Bipartite Graph

        vector< pair<ll,edge> > graph_list;
        int graph_mat[MAX_VER][MAX_VER];
        int N;
        int E;

};

void Graph::init(int type)
{
    if(type == 0)
    {
        // Initialise the adjacency list

    }
    if(type == 1)
    {
        // Initialise the adjacecny matrix

    }


}

int main()
{

    
    //Insert main code here




return 0;
}

