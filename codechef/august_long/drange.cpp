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

long int A[100];
const long int SN = 256;  // must be a power of 2

// interval updates, interval queries (lazy propagation)  
class SegmentTree {
    public:
        long int T[2*SN], U[2*SN];
        SegmentTree()
        {
            long int i;
            for(i=0;i<2*SN;i++)
            {
                T[i] = 0;
                U[i] = 0;

            }


        }
        // increment every index in [ia,ib) by incr 
        // the current node is x which represents the interval [a,b)
        void update(long int incr, long int ia, long int ib, long int x = 1, long int a = 0, long int b = SN) { // [a,b)
            ia = max(ia,a), ib = min(ib,b); // intersect [ia,ib) with [a,b)
            if(ia >= ib) return;            // [ia,ib) is empty 
            if(ia == a and ib == b) {       // We push the increment to 'pending increments'
                U[x] += incr;               // And stop recursing
                return; 
            }
            long int min1 = 1000001;
            long int min2 = 1000001;
            long int i;
            for(i=ib;i<b;i++)
            {   
                if(A[i]<min1)
                    min1=A[i];
            }
            for(i=a;i<ia;i++)
            {
                if(A[i]<min2)
                    min2=A[i];

            }

             T[x] += incr * (ib - ia);;          // Update the current node
            update(incr,ia,ib,2*x,a,(a+b)/2);  // And push the increment to its children
            update(incr,ia,ib,2*x+1,(a+b)/2, b);
        }

        long int query(long int ia, long int ib, long int x = 1, long int a = 0, long int b = SN) {
            ia = max(ia,a), ib = min(ib,b); //  intersect [ia,ib) with [a,b)
            if(ia >= ib) return 0;          // [ia,ib) is empty 
            if(ia == a and ib == b) 
                return U[x]*(b-a) + T[x];

            T[x] += U[x]*(b-a);           // Carry out the pending increments
            U[2*x] += U[x], U[2*x+1] += U[x]; // Push to the childrens' 'pending increments'
            U[x] = 0;

            return query(ia,ib,2*x,a,(a+b)/2) + query(ia,ib,2*x+1,(a+b)/2,b);
        }
};
int main()
{

    int t;
    inp_d(t);

    while(t--)
    {
        long int n,m;
        long int i,j;

        inp_ld(n);
        for(i=1;i<=n;i++)
            A[i-1] = i;

        SegmentTree s;

        inp_ld(m);

        while(m--)
        {
            long int w,x,y,z;
            inp_ld(w);
            inp_ld(x);
            inp_ld(y);
            inp_ld(z);
            if(w==1)
                s.update(z,x-1,y);
            else
                s.update(-1*z,x-1,y);

        }
        out_ld(s.query(0,n));

    }
    return 0;
}

