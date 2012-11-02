#include <cstdio>
#include <cmath>
using namespace std;

int main()
{
	int t;
	scanf("%d",&t);
	
	while(t--)
	{
		long long int n,m;
		scanf("%lld",&n);
		scanf("%lld",&m);
		long long int Imid = n/m;
		long long int Imax = (2*n-1)/m;

		if ( m%2== 0){
		long long int k	= m/2 ;
		long long int A1	= k*Imid*(Imid+1)/2 - Imid;
		long long int B1	= n*(Imax- Imid) - ( k*Imax*(Imax+1)/2 - k*Imid*(Imid+1)/2);
		
		printf("%lld\n", A1+B1);
	}
	else{
		long long int k	= m/2;
		long long int A1	= k*Imid*(Imid+1)/2;
		long long int B1	= n*(Imax- Imid) - ( k*Imax*(Imax+1)/2 - k*Imid*(Imid+1)/2);
		long long int A2	= A1 + floor(Imid/2)*ceil(Imid)/2	;
		long long int B2	= B1 - ( floor(Imax/2)*ceil(Imax/2) - floor(Imid/2)*ceil(Imid/2) );

		printf("%lld\n", A2+B2);
		}
	}		
}
