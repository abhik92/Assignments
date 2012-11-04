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
 


/* End of fast IO*/


/* Calculate nCr */
long long int f[MAX], finv[MAX];

long long int p(long long int x, long long int y){
  int r;
  if(y==0)
    return 1;
  if(y%2)
    return (((long long unsigned)x*p(x, y-1))%mod);
  r=p(x, y/2);
  return (((long long unsigned)r*r)%mod);
}
 
/* Call precalculate once in main before using the nCr function 
 * set MAX in the macro definition to define upper limit of n 
 */
void precalculate() {
  int i;
  f[0]=1;
  for(i=1; i<MAX; i++)
    f[i]=(((long long unsigned)i*f[i-1])%mod);
  i--;
  finv[i]=p(f[i],mod-2);
  for(i--; i>=0; i--)
    finv[i]=(((long long unsigned)(i+1)*finv[i+1])%mod);
}
 
long long int ncr(long int n, long int r){
  if(n<r)
    return 0;
  return ((((f[n]*finv[r])%mod)*finv[n-r])%mod);
}



int main()
{
    int t;
    inp_d(t);

    while(t--)
    {
        int r,c;
        inp_d(r);
        inp_d(c);

        int s[505][505];

        int i,j;
        for(i=1;i<=r;i++)
        {
            for(j=1;j<=c;j++)
            {
                inp_d(s[i][j]);
            }
    


        }
        s[r][c] = 1;

        for (i=c-1;i>=1;i--){
                 s[r][i]=s[r][i+1]-s[r][i];
                    if (s[r][i]<=0)s[r][i]=1;
            }

        for (i=r-1;i>=1;i--){
                    s[i][c] = s[i+1][c]-s[i][c];
                    if (s[i][c]<=0)s[i][c]=1;
            }

         for (i=r-1;i>=1;i--)
            for (j=c-1;j>=1;j--){
                    s[i][j] = min (s[i+1][j]-s[i][j], s[i][j+1]-s[i][j]);
                    if (s[i][j]<=0)s[i][j]=1;
        }        
        out_d(s[1][1]);
         out_nl();
        
    }
return 0;
}
