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

/*Structure for composite sorting*/
struct event
{
    int start;
    int end;
    ll cost;
    
    bool operator()(const event &p1,const event &p2)
    {
        return p1.end<p2.end;
    
    }

}temp;



int main()
{
    int t;
    inp_d(t);

    while(t--)
    {
        int n;
        inp_d(n);

        int i;
        event lst[2005];
        for(i=0;i<n;i++)
        {
            int s,e,c;
            inp_d(s);
            inp_d(e);
            inp_d(c);
            
            lst[i].start = s;
            lst[i].end = e;
            lst[i].cost = c;

        }
        sort(lst,lst+n,temp);
        
        ll dp[2005];
        for(i=0;i<2001;i++)
            dp[i] = 0;
        
        dp[0] = lst[0].cost;
        for(i=1;i<n;i++)
        {
            int j;
            ll lmax = -1;
            for(j=i-1;j>=0;j--)
            {
                
                if(lst[j].end<=lst[i].start)
                {
                    dp[i] = max(lmax,dp[j]+lst[i].cost);
                    if(dp[i]>lmax)
                        lmax = dp[i];
                    
                }


            }
            dp[i] = max(lmax,lst[i].cost);

        }
        
        ll max = 0;
        for(i=0;i<n;i++)
        {
            if(dp[i]>max)
                max = dp[i];

        }
        out_lld(max);
        out_nl();

    }
    




return 0;
}

