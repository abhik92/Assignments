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
 
/*Structure for composite sorting*/
struct struct_name
{
    long int mem1;
    long int mem2;
    
    bool operator()(const struct_name &p1,const struct_name &p2)
    {
        return p1.mem1<p2.mem2;
    
    }
 
}struct_variable;
 
 
/* Fast IO */
class FastInput {
public:
    FastInput() {
        m_dataOffset = 0;
        m_dataSize = 0;
        m_v = 0x80000000;
    }
	
    uint32_t ReadNext() {
        if (m_dataOffset == m_dataSize) {
            int r = read(0, m_buffer, sizeof(m_buffer));
            if (r <= 0) return m_v;
            m_dataOffset = 0;
            m_dataSize = 0;
            int i = 0;
            if (m_buffer[0] < '0') {
                if (m_v != 0x80000000) {
                    m_data[m_dataSize++] = m_v;
                    m_v = 0x80000000;
                }
                for (; (i < r) && (m_buffer[i] < '0'); ++i);
            }
            for (; i < r;) {
                if (m_buffer[i] >= '0') {
                    m_v = m_v * 10 + m_buffer[i] - 48;
                    ++i;
                } else {
                    m_data[m_dataSize++] = m_v;
                    m_v = 0x80000000;
                    for (i = i + 1; (i < r) && (m_buffer[i] < '0'); ++i);
                }
            }
        }
        return m_data[m_dataOffset++];
    }
	
public:
    uint8_t m_buffer[32768];
    uint32_t m_data[16384];
    size_t m_dataOffset, m_dataSize;
    uint32_t m_v;
};
 
long long int power(long long int n)
{
    if(n==0)
        return 1;
    else if(n==1)
        return 2;
    else if(n%2 == 0)
    {
        long long int a = power(n/2);
        return (a*a)%mod;
 
    }
    else
    {
        long long int a = power(n/2);
        return (((a*a)%mod)*2)%mod;
 
    }
 
 
 
 
}
 
long long* mat_mul(long long int a[10],long long int b[10])
{
    
    long long int *c = (long long int *)malloc(sizeof(long long int)*10);
    c[0] = ((a[0]*b[0])%mod + (a[1]*b[3])%mod + (a[2]*b[6])%mod)%mod;
    c[1] = ((a[0]*b[1])%mod + (a[1]*b[4])%mod + (a[2]*b[7])%mod)%mod;
    c[2] = ((a[0]*b[2])%mod + (a[1]*b[5])%mod + (a[2]*b[8])%mod)%mod;
    c[3] = ((a[3]*b[0])%mod + (a[4]*b[3])%mod + (a[5]*b[6])%mod)%mod;
    c[4] = ((a[3]*b[1])%mod + (a[4]*b[4])%mod + (a[5]*b[7])%mod)%mod;
    c[5] = ((a[3]*b[2])%mod + (a[4]*b[5])%mod + (a[5]*b[8])%mod)%mod;
    c[6] = ((a[6]*b[0])%mod + (a[7]*b[3])%mod + (a[8]*b[6])%mod)%mod;
    c[7] = ((a[6]*b[1])%mod + (a[7]*b[4])%mod + (a[8]*b[7])%mod)%mod;
    c[8] = ((a[6]*b[2])%mod + (a[7]*b[5])%mod + (a[8]*b[8])%mod)%mod;
    
    return c;
 
 
 
}
 
long long int* mat_power(long long int n,long long int mat[10])
{
    long long int* ans = (long long int*)malloc(sizeof(long long int)*10);
    int i;
    for(i=0;i<9;i++)
        ans[i] = mat[i];
 
    if(n == 0)
    {
        ans[0] = 1;
        ans[1] = 0;
        ans[2] = 0;
        ans[3] = 0;
        ans[4] = 1;
        ans[5] = 0;
        ans[6] = 0;
        ans[7] = 0;
        ans[8] = 1;
 
        return ans;
    }
    else if(n==1)
    {
        return ans;
 
    }
    else if(n%2 == 0)
    {
        ans = mat_power(n/2,mat);
        return mat_mul(ans,ans);
 
    }
    else
    {
        ans = mat_power(n/2,mat);
        return mat_mul(ans,mat_mul(ans,mat));
 
 
    }
 
 
 
}
 
long long int expo(long long int n)
{
    long long int* mat = (long long int*)malloc(sizeof(long long int)*10);
    mat[0] = 1;
    mat[1] = 1;
    mat[2] = 1;
    mat[3] = 1;
    mat[4] = 0;
    mat[5] = 0;
    mat[6] = 0;
    mat[7] = 1;
    mat[8] = 0;
    
    mat = mat_power(n-2,mat);
    long long int ans = ((4*mat[0] + 2*mat[1])%mod + mat[2])%mod;
 
    return ans;
 
}
 
 
 
int main()
{
 
    int t;
    inp_d(t);
 
    while(t--)
    {
        long long int n;
        inp_lld(n);
        if(n==1 || n==2)
            out_lld((long long int)0);
        else
        {
            long long int ans = (power(n) - expo(n))%mod;
            if(ans>=0)
                out_lld(ans);
            else
                out_lld(ans+mod);
        }
        out_nl();
 
 
 
 
    }
 
 
 
 
return 0;
}
