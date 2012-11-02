
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

long long* mat_mul(long long int a[6],long long int b[6])
{
    
    long long int *c = (long long int *)malloc(sizeof(long long int)*6);
    c[0] = (a[0]*b[0] + a[1]*b[2])%mod;
    c[1] = (a[0]*b[1] + a[1]*b[3])%mod;
    c[2] = (a[2]*b[0] + a[3]*b[2])%mod;
    c[3] = (a[2]*b[1] + a[3]*b[3])%mod;
    
    return c;



}


long long* expo(long long int a[6],long long int n)
{
    long long int *b = (long long int*)malloc(sizeof(long long int)*6);
    if(n==0)
    {
        b[0] = b[3] = 1;
        b[1] = b[2] = 0;
        return b;
    }
    if (n == 1)
    {
        b[0] = a[0];
        b[1] = a[1];
        b[2] = a[2];
        b[3] = a[3];
        return b;
    }
    if(n%2 == 0)
    {
        long long int *d = expo(a,n/2);
        return mat_mul(d,d);


    }
    else
    {

        long long int *d = expo(a,n/2);
        return mat_mul(d,mat_mul(d,a));




    }



}


long long int solve(long long int n)
{
    long long int *a = (long long int*)malloc(sizeof(long long int)*6);
    a[0] = 2;
    a[1] = 3;
    a[2] = 1;
    a[3] = 0;

    long long int *b = expo(a,n-2);

    return (b[0]*24 + b[1]*12)%mod;

}



int main()
{

    int t;
    inp_d(t);

    while(t--)
    {

        long long int n;
        inp_lld(n);
        
        if(n==2)out_d(12);
        else{
        n--;

        out_lld(solve(n));}
        out_nl();



    }




return 0;
}

