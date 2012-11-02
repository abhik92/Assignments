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
using namespace std;
typedef long long LL;
#define FOR(k,a,b) for(int k(a); k < (b); ++k)
#define REP(k,a) for(int k=0; k < (a); ++k)

int main()
{


	int N,M,c,S=0,T,o;
	long long int maxflow = 0,mxo;
    int a,b;
	scanf("%d",&M);// number of vertices
    scanf("%d",&N); // Number of edges
	
    T = M-1;
    const int R = M+1;
	int cap[R][R],res[R][R],act[R][R],visited[R];
	deque<int> q;
	memset(cap,0,sizeof(cap));
	memset(act,0,sizeof(act));
	
    REP(i,N)
	{
		scanf("%d%d%d",&a,&b, &c); // The edge - edge - capacity tuple
		if(a!=b){
            cap[b-1][a-1]+=c;
            cap[a-1][b-1]+=c;
        }
	}

	while(true)
	{
		//calculate residual
		memset(res,0,sizeof(res));
		REP(i,R)
		REP(j,R)
		{
			res[i][j]+=cap[i][j]-act[i][j];
			res[j][i]+=act[i][j];
		}
		//bfs find shortest augment path
		memset(visited,-1,sizeof(visited));
		q.push_back(0);
		visited[0]=0;
		while(q.size())
		{
			o=q.front();
			q.pop_front();
			REP(i,R)
			{
				if(visited[i]!=-1 || res[o][i]==0)
					continue;
				visited[i]=o;
				if(i==T)
				{
					q.clear();
					break;
				}
				else
					q.push_back(i);
			}
		}
		//calculate maximum
		o=T;
		mxo=(1e9);
		while(o>0)
		{
			mxo=min(mxo,(long long )res[visited[o]][o]);
			o=visited[o];
		}
		if(visited[T]==-1 || mxo==0)
			break;
		maxflow+=mxo;
		o=T;
		while(o>0)
		{
			act[visited[o]][o]+=mxo;
			o=visited[o];
		}
	}
	printf("%lld\n", maxflow);
	return 0;
}
