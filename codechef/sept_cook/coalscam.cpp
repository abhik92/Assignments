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

#define mod 1000007

using namespace std;


#define edge pair< int, int >
#define MAX 5005
 
vector< pair< long long int, edge > > GRAPH, MST,graph2;
int parent[5005], N, E;
    int m1;
    long long int edg = 0;
long long int total,c2;
int findset(int x, int *parent)
{
    if(x != parent[x])
        parent[x] = findset(parent[x], parent);
    return parent[x];
}
void kruskal()
{
    int i, pu, pv;
    sort(GRAPH.begin(), GRAPH.end()); // increasing weight
    vector< pair< long long int, edge > > reshuffle;
    for(i=GRAPH.size()-1;i>=0;i--)
    {
        reshuffle.push_back(GRAPH[i]);

    }
    GRAPH.clear();
    for(i=0;i<reshuffle.size();i++)
    {
        
        GRAPH.push_back(reshuffle[i]);

    }

    for(i=0; i<E; i++)
    {
        pu = findset(GRAPH[i].second.first, parent);
        pv = findset(GRAPH[i].second.second, parent);
        if(pu != pv)
        {
            MST.push_back(GRAPH[i]); // add to tree
            total += GRAPH[i].first; // add edge cost
            c2 += GRAPH[i].first; // add edge cost
            parent[pu] = parent[pv]; // link
            edg++;
        }
    }
}
void kruskal2()
{
    int i, pu, pv;
    sort(graph2.begin(), graph2.end()); // increasing weight
    for(i=0; i<m1; i++)
    {
        pu = findset(graph2[i].second.first, parent);
        pv = findset(graph2[i].second.second, parent);
        if(pu != pv)
        {
            MST.push_back(graph2[i]); // add to tree
            total += graph2[i].first; // add edge cost
            parent[pu] = parent[pv]; // link
            edg++;
        }
    }
}
void reset()
{
    // reset appropriate variables here
    MST.clear(); GRAPH.clear();graph2.clear();
    edg = 0;
    total = 0;
    c2 = 0;
    for(int i=0; i<N; i++) parent[i] = i;
}

 
int main()
{
    int i, u, v;
    long long int w;
    int t;
    inp_d(t);
    while(t--)
    {
        scanf("%d %d %d", &N, &m1, &E);
        reset();
        
        for(i=0; i<m1; i++)
        {
            scanf("%d %d %lld", &u, &v, &w);

            graph2.push_back(pair< long long int, edge >(w, edge(u, v)));
        }
        for(i=0; i<E; i++)
        {
            scanf("%d %d %lld", &u, &v, &w);
            GRAPH.push_back(pair< long long int, edge >(w, edge(u, v)));
        }
        kruskal(); // runs kruskal and construct MST vector
        if(edg<N-1)
        kruskal2();
        if(edg == N-1){
        out_lld(c2);
        out_s(" ");
        out_lld(total);
        out_nl();}
        else
        {
            out_s("Impossible\n");

        }
    }

    return 0;
}

