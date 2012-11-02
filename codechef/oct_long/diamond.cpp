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
 
double dp[2005][2005];

void precalculate()
{
    int a[2005];
    int i,j,r;
    for(i=0;i<2000;i++)
    {
        a[i] = 1;
        dp[i][i] = 0;
        
    }

    for(i=1999;i>=0;i--)
    {
        for(j=i+1;j<2000;j++)
        {
                dp[i][j] = 0.25*(dp[i+2][j] + dp[i][j-2] + dp[i+1][j-1] + dp[i+1][j-1] +2*a[i] + 2*a[j]);

        }




    }

    for(i=0;i<5;i++)
    {
        for(j=i+1;j<5;j++)
            printf("%lf ",dp[i][j]);
        out_nl();


    }


}



int main()
{
    precalculate();

    int t;
    inp_d(t);

    while(t--)
    {
        int n;
        inp_d(n);

        int b[2005];
        int i;
        for(i=0;i<n;i++)
        {
            inp_d(b[i]);

        } 
        double ans = 0;
        double div = 0;
        for(i=0;i<n;i++)
            div = div + dp[i][n];

        for(i=0;i<n;i++)
        {
                ans = ans + ((dp[0][n])*b[i])/div;
            



        }
        printf("%lf\n",ans);





    }
    




return 0;
}

