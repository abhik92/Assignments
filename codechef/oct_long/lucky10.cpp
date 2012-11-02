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
        char a[20005];
        char b[20005];

        inp_s(a);
        inp_s(b);

        
        int ac[4];
        int bc[4];
        
        int i;
        for(i=0;i<4;i++)
        {
            ac[i] = 0;
            bc[i] = 0;

        }

        int ans_4 = 0;
        int ans_7 = 0;
        for(i=0;i<strlen(a);i++)
        {
            if(a[i]<='3')
                ac[0]++;
            else if(a[i]<='6' && a[i]!='4')
                ac[2]++;
            else if(a[i] == '4')
                ac[1]++;
            else if(a[i] == '7')
                ac[3]++;
            
            if(b[i]<='3')
                bc[0]++;
            else if(b[i]<='6' && b[i]!='4')
                bc[2]++;
            else if(b[i] == '4')
                bc[1]++;
            else if(b[i] == '7')
                bc[3]++;

        }
        
        /*for(i=0;i<4;i++)
        {
            out_d(ac[i]);
            out_s(" ");
            out_d(bc[i]);
            out_nl();

        }*/
        // first array 7
        if((bc[2]+bc[0]+bc[1])>=ac[3] && ac[3]!=0)
        {
            ans_7 += ac[3];
            for(i=0;i<ac[3];i++)
            {
                if(bc[2]>0)
                    bc[2]--;
                else if(bc[0]>0)
                    bc[0]--;
                else
                    bc[1]--;

            }
            ac[3] = 0;


        }
        //first array 4
        else if(ac[3]!=0)
        {
            int r = (bc[2]+bc[0]+bc[1]);
            ans_7 += r;
            bc[2] = 0;
            bc[0] = 0;
            bc[1] = 0;
            ac[3] = ac[3] - r; 

        }
        // second array 7
        if((ac[2]+ac[0] + ac[1])>=bc[3] && bc[3]!=0)
        {
            ans_7 += bc[3];
            for(i=0;i<bc[3];i++)
            {
                if(ac[2]>0)
                    ac[2]--;
                else if(ac[0]>0)
                    ac[0]--;
                else
                    ac[1]--;

            }
            bc[3] = 0;


        }
        //second array 4
        else if(bc[3]!=0)
        {
            int r = (ac[2]+ac[0]+ac[1]);
            ans_7 += r;
            ac[2] = 0;
            ac[0] = 0;
            ac[1] = 0;
            bc[3] = bc[3] - r; 

        }

       // FOR 4 s
        // first array 7
        if(bc[0]>=ac[1] && ac[1]!=0)
        {
            ans_4 += ac[1];
            bc[0] = bc[0] -ac[1];

            ac[1] = 0;

        }
        //first array 4
        else if(ac[1]!=0)
        {
            ans_4 += bc[0];
            ac[1] = ac[1] - bc[0]; 
            bc[0] = 0;

        }
        // second array 7
        if((ac[0])>=bc[1] && bc[1]!=0)
        {
            ans_4 += bc[1];
            ac[0] = ac[0] - bc[1]; 
            bc[1] = 0;


        }
        //second array 4
        else if(bc[1]!=0)
        {
            ans_4 += ac[0];
            bc[1] = bc[1] - ac[0]; 
            ac[0] = 0;

        }
        
        ans_7 = ans_7 + min(ac[3],bc[3]);
        ans_4 = ans_4 + min(ac[1],bc[1]);
        for(i=0;i<ans_7;i++)
            out_c('7');
        for(i=0;i<ans_4;i++)
            out_c('4');

        out_nl();
        
    }
    




return 0;
}

