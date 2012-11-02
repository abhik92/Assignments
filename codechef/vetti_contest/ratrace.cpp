
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
#define mod 1000000007

using namespace std;

#define SET(p) memset(p, -1, sizeof(p))
#define CLR(p) memset(p, 0, sizeof(p))
 
const int MAXN = 5005, MAXE = 60006;
 
int src, snk, nNode, nEdge;
int Q[MAXN], fin[MAXN], pro[MAXN], dist[MAXN];
int flow[MAXE], cap[MAXE], next[MAXE], to[MAXE];
 
inline void init(int _src, int _snk, int _n) {
    src = _src, snk = _snk, nNode = _n, nEdge = 0;
    SET(fin);
}
 
inline void add(int u, int v, int c) {
    to[nEdge] = v, cap[nEdge] = c, flow[nEdge] = 0, next[nEdge] = fin[u], fin[u] = nEdge++;
    to[nEdge] = u, cap[nEdge] = c, flow[nEdge] = 0, next[nEdge] = fin[v], fin[v] = nEdge++;
}
 
bool bfs() {
    int st, en, i, u, v;
    SET(dist);
    dist[src] = st = en = 0;
    Q[en++] = src;
    while(st < en) {
        u = Q[st++];
        for(i=fin[u]; i>=0; i=next[i]) {
            v = to[i];
            if(flow[i] < cap[i] && dist[v]==-1) {
                dist[v] = dist[u]+1;
                Q[en++] = v;
            }
        }
    }
    return dist[snk]!=-1;
}
 
int dfs(int u, int fl) {
    if(u==snk) return fl;
    for(int &e=pro[u], v, df; e>=0; e=next[e]) {
        v = to[e];
        if(flow[e] < cap[e] && dist[v]==dist[u]+1) {
            df = dfs(v, min(cap[e]-flow[e], fl));
            if(df>0) {
                flow[e] += df;
                flow[e^1] -= df;
                return df;
            }
        }
    }
    return 0;
}
 
long long dinitz() {
    long long ret = 0;
    int df;
    while(bfs()) {
        for(int i=1; i<=nNode; i++) pro[i] = fin[i];
        while(true) {
            df = dfs(src, INF);
            if(df) ret += (long long)df;
            else break;
        }
    }
    return ret;
}
 
int main() {
    int n;
    inp_d(n);
    int i,j;
    bool maze[n+2][n+2];
    for(i=0;i<=n+1;i++)
    {
        for(j=0;j<=n+1;j++)
            maze[i][j] = false;

    }
    
    for(i=1;i<=n;i++)
    {
        for(j=1;j<=n;j++)
        {
            int r;
            inp_d(r);
            if(r==0)
                maze[i][j] = true;
            else
                maze[i][j] = false;

        }
    }
    
   
    int e=0, u, v, c;
    init(1, n*n, n*n);
    
    for(i=1;i<=n;i++)
    {
        for(j=1;j<=n;j++)
        {
           if(maze[i][j] && maze[i+1][j])
           {
                u = (i-1)*n+j;
                v = i*n + j;
                c = 1;
                e++; 
                add(u, v, c);
                add(v, u, c);
           }

           if(maze[i][j] && maze[i][j+1])
           {
                u = (i-1)*n+j;
                v = (i-1)*n + j+1;
                c = 1;
                e++;
                add(u, v, c);
                add(v, u, c);
           }

        }

    }
    
    /*for(i=0; i<e; i++) {
        scanf("%d%d%d", &u, &v, &c);
        if(u!=v) add(u, v, c);
    }*/
    printf("%lld\n", dinitz());
    return 0;
}
