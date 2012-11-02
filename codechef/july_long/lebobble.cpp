
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

long long int binsearch(long long int a)
{






}


int main()
{
    int t;
    inp_d(t);

    while(t--)
    {
        long int n;
        long long int d,b[50005];
        int p[50005];

        inp_ld(n);
        inp_lld(d);
        
        long int i;
        for(i=0;i<n;i++)
            inp_lld(b[i]);
        for(i=0;i<n;i++)
            inp_d(p[i]);


        double swp[50005];
        swp[0] = 0;
        for(i=1;i<n;i++)
        {
            long long int a1 = b[i] + d;
            long long int num1 = binsearch(a1);
            long long int a2 = b[i];
            long long int num2 = binsearch(a2);
            
            swp[i] = swp[i-1] + (p[i]/100.0)*num1 + ((100-p[i])/100.0)*num2;
        }
        printf("%0.4lf\n",swp[n-1]);

    }
    




return 0;
}

