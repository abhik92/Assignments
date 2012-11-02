
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

/*All global definitions */
#define INF 1000000000

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

#define MAX 500
#define mod 1000007

using namespace std;

#define pii pair< int, int >

struct comp {
    bool operator() (const pii &a, const pii &b) {
        return a.second > b.second;
    }
};
 
priority_queue< pii, vector< pii >, comp > Q;
vector< pii > GRAPH[MAX];
int N,E;
int D[MAX];
bool F[MAX];
 
void dijkstra() {
       
    int sz;
    
    int i,u,v,w;
    // dijkstra
    while(!Q.empty()) {
        u = Q.top().first;
        Q.pop();
        if(F[u]) continue;
        sz = GRAPH[u].size();
        
        for(i=0; i<sz; i++) {
            v = GRAPH[u][i].first;
            w = GRAPH[u][i].second;
            
            if(!F[v] && D[u]+w < D[v]) {
                D[v] = D[u] + w;
                Q.push(pii(v, D[v]));
            }
        }
        F[u] = 1; // done with u
    }
}

int main()
{

    int i, u, v, w,starting;
    
    scanf("%d %d", &N, &E);
    for(i=0; i<E; i++) {
        scanf("%d %d %d", &u, &v, &w);
        GRAPH[u].pb(pii(v, w));
        GRAPH[v].pb(pii(u, w)); // for undirected
    }
    scanf("%d", &starting);
    
    // initialize graph
    for(i=0; i<N; i++) D[i] = INF;
    
    D[starting] = 0;
    Q.push(pii(starting, 0));

    dijkstra();
    
    for(i=0; i<N; i++)
        printf("Node %d, min weight = %d\n", i, D[i]);

    return 0;
}

