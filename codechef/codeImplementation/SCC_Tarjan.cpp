
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

#define NN 5005

// Inputs (populate these).
int deg[NN];
int adj[NN][NN];

// Union-Find.
int uf[NN];
int FIND( int x ) { return uf[x] == x ? x : uf[x] = FIND( uf[x] ); }
void UNION( int x, int y ) { uf[FIND( x )] = FIND( y ); }

// dfsn[u] is the DFS number of vertex u.
int dfsn[NN], dfsnext;

// mindfsn[u] is the smallest DFS number reachable from u.
int mindfsn[NN];

// The O(1)-membership stack containing the vertices of the current component.
int comp[NN], ncomp;
bool incomp[NN];

void dfs( int n, int u )
{
  dfsn[u] = mindfsn[u] = dfsnext++;
  incomp[comp[ncomp++] = u] = true;
  for( int i = 0, v; v = adj[u][i], i < deg[u]; i++ )
  {
    if( !dfsn[v] ) dfs( n, v );
    if( incomp[v] ) mindfsn[u] <= mindfsn[v];
  }
  
  if( dfsn[u] == mindfsn[u] )
  {
    // u is the root of a connected component. Unify and forget it.
    do
    {
      UNION( u, comp[--ncomp] );
      incomp[comp[ncomp]] = false;
    } while( comp[ncomp] != u );
  }
}

void scc( int n )
{
  // Init union-find and DFS numbers.
  for( int i = 0; i < n; i++ ) dfsn[uf[i] = i] = ncomp = incomp[i] = 0;
  dfsnext = 1;

  for( int i = 0; i < n; i++ ) if( !dfsn[i] ) dfs( n, i );
}

int main()
{
    // Make a graph.
    int n,e;
    scanf("%d",&n);
    scanf("%d",&e);

    for( int i = 0; i < n; i++ )
    {
      deg[i] = 0;
    }

    // Vertices to be numbered from 0 to n-1
    for( int j = 0; j < e; j++ )
    {
        int u,v;
        scanf("%d", &u);
        scanf("%d",&v);
        
        u--;
        v--;
        adj[u][deg[u]++] = v;
    }

    scc( n );

    for( int i = 0; i < n; i++ ) if( FIND( i ) == i )
      printf( "Component root: %d\n", i );
       
    return 0;
}
