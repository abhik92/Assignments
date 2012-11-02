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
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <vector>
#include <map>

using namespace std;
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
 



int m,p_in;
long long int n;
    double p;
    int t, t1;
    long long int i;
    vector<bool> b(1073741825);
    vector<double> a;
    double temp;
int main(int argc, char** argv) {
    
    long long int j;
    FastInput obj;
    scanf("%d",&t);
    //t = obj.ReadNext();

    for(t1=0; t1<t;t1++)
    {
        scanf("%lld",&n);
        a.clear();
        //m = obj.ReadNext();
        //p_in = obj.ReadNext();
        scanf("%d%d",&m,&p_in);
        p= ((double)p_in )/100;
        for(i = 0; i < n; i++)
            b[i]=0;
        for(i = 0; i < m; i++)
        {
            scanf("%lld", &j);
            //j= obj.ReadNext();
            b[j-1] = 1;
        }
        n = n/2;
        for(i = 0 ; i < n ; i++)
            {
                temp = b[2*i]*b[2*i+1] + p * (b[2*i]*(1-b[2*i+1]) + b[2*i+1]*(1-b[2*i]));
                a.push_back(temp);
            }
        
        
        n = n/2;
        while(n > 0) {
            for(i = 0 ; i < n ; i++)
            {
                temp = a[2*i]*a[2*i+1] + p * (a[2*i]*(1-a[2*i+1]) + a[2*i+1]*(1-a[2*i]));
                a[i] = temp;
            }
            n /=2;
        }    
            printf("%0.6lf\n",(100* a[0]));
        
    }
    return 0;
}


