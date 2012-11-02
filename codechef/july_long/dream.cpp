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

long int n,k;
vector< pair<long long int,int> > c;
bool logic(long long int n,int i)
{
    int l = 0;
    int r = c.size();
    int m = (l+r)/2;
    
    while(l<=r)
    {
        if(n>c[m].first)
            l=m+1;
        else if(n<c[m].first)
            r=m-1;
        else
            break;
        
        m = (l+r)/2;

    }

    if(abs(c[m].second-i)>=k || c[m].second == -1*INF)
    {        
        c[m].second = i;
        return true;
    }

    return false;
}


int main()
{
    inp_ld(n);
    inp_ld(k);
    
    long long int a[100005];
    long long int b[100005];

    long int i;

    for(i=0;i<n;i++)
    {
        inp_lld(a[i]);
        b[i] = a[i];
    }
    sort(b,b+n);
    
    long long int lins = -1;
    for(i=0;i<n;i++)
    {
        if(b[i]!=lins)
        {
            lins = b[i];
            pair<long long int,int> temp;
            temp.first = b[i];
            temp.second = -1*INF;
            
            c.push_back(temp);

        }
       

    }
    
    long long int ans = 0;
    for(i=0;i<n;i++)
    {
        if(logic(a[i],i))
            ans++;
    }

    out_lld(ans);
    out_nl();

return 0;
}

