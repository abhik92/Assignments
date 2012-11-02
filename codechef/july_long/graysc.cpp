
/*
 * author : karthik abinav
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

unsigned long long a[100010];
unsigned long long b[100010];
long int k = -1,n;
pair<unsigned long long,long int> sor[100010];
int binary[100];
unsigned long long dpow[100];

void dec2bin(unsigned long long n)
{
    int r = 0;
    int revans[100];
    while(n!=0)
    {
        revans[r++]=(n%2);
        n=n/2;
    }
    int i;
    for(i=r;i<64;i++)
        revans[i] = 0;

    for(i=0;i<64;i++)
        binary[i] = revans[63-i];

}

bool binsearch(unsigned long long qq)
{
    long int l = 0;
    long int r = k;
    long int m=(l+r)/2;

    while(l<=r)
    {
        if(sor[m].first == qq)
            return true;
        else if(sor[m].first>qq)
            r = m-1;
        else
            l = m+1;
        m = (l+r)/2;
    }

    return false;
}

bool logic()
{
    if(n>100)
    {
        long int i;
        for(i=0;i<k;i++)
        {
            int t1[100];
            int rr,pos;
            dec2bin(sor[i].first);

            for(rr=0;rr<64;rr++)
                t1[rr] = binary[rr];
            unsigned long long num = sor[i].first;
            for(pos=0;pos<64;pos++)
            {
                int bitpos = t1[pos];
                for(rr=pos+1;rr<64;rr++)
                {
                    int temp = t1[rr];
                    unsigned long long num1,num2,num3,num4;

                    num1 = num - (temp*dpow[63-rr])-(bitpos*dpow[63-pos]);//
                    num2 = num - (temp*dpow[63-rr]) + ((!bitpos)*dpow[63-pos]);
                    num3 = num-(bitpos*dpow[63-pos])+((!temp)*dpow[63-rr]);
                    num4 = num +((!bitpos)*dpow[63-pos])+((!temp)*dpow[63-rr]);
                    
                    if(binsearch(num1) && binsearch(num2) && binsearch(num3) && binsearch(num4))
                        return true;
                    
                }
            }
        }
    }
    else
    {
        int i,j,q,w;
        for (i = 0;i<n-3;i++)
        {
            for(j=i+1;j<n-2;j++)
            {
                for(q = j+1;q<n-1;q++)
                {
                    for(w = q+1;w<n;w++)
                    {
                        if ((b[i] ^ b[j] ^ b[q] ^ b[w]) == 0)
                            return true;
                    }
 
                }
            }
        }
 




    }

    return false;
}
void populate_powers()
{
    int i;
    for(i=0;i<64;i++)
        dpow[i] = pow(2,i);
}

int main()
{

    populate_powers();
    scanf("%ld",&n);
    long int i;
    for(i=0;i<n;i++)
    {
        scanf("%llu",&a[i]);
        b[i] = a[i];
    }
    
    sort(a,a+n);

    unsigned long long cur = -1;
    for(i=0;i<n;i++)
    {
        if(a[i]!=cur )
        {
            k++;
            sor[k].first = a[i];
            sor[k].second = 1;
            cur = a[i];
        }
        else
        {
            sor[k].second++;

        }

    }
    k++;
    long int num_2 = 0;
    long int num_4 = 0;
    for(i=0;i<k;i++)
    {
        if(sor[i].second>=4)
        {
            num_4++;
            break;
        }
        if(sor[i].second>=2)
            num_2++;

    }

    if(num_2>=2 || num_4>=1)
        printf("Yes\n");

    else
    {
        bool tr = logic();
        if(tr)
            printf("Yes\n");
        else
            printf("No\n");
    }

    return 0;
}
