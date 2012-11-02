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

#define MAX 1000100
using namespace std;

vector<long long int> plist;
map<long long int , long long int > calc;

void gen_primes() 
 { 
       long long int i,j;
       calc[1] = 1;
       calc[0] = 0;
       
       int primes[1000115];
       for(i=0;i<MAX;i++) primes[i] = 1;

       for(i=2;i<=(long long int)sqrt(MAX);i++) 
       {
           if (primes[i]){
            for(j=i;j*i<MAX;j++) primes[i*j] = 0;
           }
       }

       for(i=2;i<MAX;i++)
       {
            if(primes[i])
            {
                plist.push_back(i);
            }

       }
 } 

long long int gcd(long long int a,long long int b){
        
        if(b==0)
            return a;
        else
            return gcd(b,a%b);

    }

long long int divisors(long long int n)
{
    long long int i;
    if(calc[n])
        return calc[n];
    
    
    long long int nod = 1;
    long long int exponent;
    long long int remain = n;
 
    for (long long int i = 0; i < plist.size(); i++) {
        
        if(calc[remain]){
            calc[n] = nod*calc[remain];
            return calc[n];
        }
        if (plist[i] * plist[i] > n) {
            calc[n] = nod*2;
            return nod * 2;
        }
 
        exponent = 1;
        while (remain % plist[i] == 0) {
            exponent++;
            remain = remain / plist[i];
        }
        nod *= exponent;
 
        if (remain == 1) {
            calc[n] = nod;
            return nod;
        }
    }
    calc[n] = nod;
    return nod;


}
int main()
{

    gen_primes();   
    
    long long int n,k,q;
    int t;
    inp_lld(n);
    inp_lld(q);

    while(q--)
    {
        inp_d(t);
        inp_lld(k);
        
        
        if(t == 1)
            out_lld(divisors(gcd(n,k)));
        
        if(t==2)
        {
           if(n%k != 0)
               out_d(0);
           else
               out_lld(divisors(n/k));


        }
        if(t==3)
        {
            if(n%k==0)
                out_lld(divisors(n)-divisors(n/k));
            else
                out_lld(divisors(n));


        }
        out_nl();
    }



    return 0;
}

