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

struct node
{
    long key;
    struct node *left;
    struct node *right;
    int height;
    int size;
};

int siz(struct node *N)
{
    if (N == NULL)
        return 0;
    return N->size;
}
int height(struct node *N)
{
    if (N == NULL)
        return 0;
    return N->height;
}
struct node* findkthlargest(struct node *t,int k)
{
        int right_size=siz(t->right);
        if(right_size+1==k) return(t);
        else if(k<=right_size) return(findkthlargest(t->right,k));
        else return(findkthlargest(t->left,k-right_size-1));
}

struct node* newNode(long key)
{
    struct node* node = (struct node*)malloc(sizeof(struct node));
    node->key=key;
    node->left=NULL;
    node->right=NULL;
    node->height=1;  
    node->size=1;
    return(node);
}
 
struct node *rightRotate(struct node *y)
{
    struct node *x = y->left;
    struct node *T2 = x->right;
 
    x->right = y;
    y->left = T2;
 
    y->height = max(height(y->left), height(y->right))+1;
    y->size = siz(y->left)+siz(y->right)+1;
    x->height = max(height(x->left), height(x->right))+1;
    x->size = siz(x->left) + siz(x->right)+1;
    
    return x;
}
 
struct node *leftRotate(struct node *x)
{
    struct node *y = x->right;
    struct node *T2 = y->left;
 
    y->left = x;
    x->right = T2;
 
    x->height = max(height(x->left), height(x->right))+1;
    x->size = siz(x->left) + siz(x->right)+1;
    y->height = max(height(y->left), height(y->right))+1;
    y->size = siz(y->left) + siz(y->right)+1;
    
    return y;
}
 
int getBalance(struct node *N)
{
    if (N == NULL)
        return 0;
    return height(N->left) - height(N->right);
}
 
struct node* insert(struct node* node, long key)
{
    if (node == NULL)
        return(newNode(key));
 
    if (key < node->key)
        node->left  = insert(node->left, key);
    else
        node->right = insert(node->right, key);
 
    node->height = max(height(node->left), height(node->right)) + 1;
    node->size = siz(node->left) + siz(node->right) + 1;
    int balance = getBalance(node);
 
 
    if (balance > 1 && key < node->left->key)
        return rightRotate(node);
 
    if (balance < -1 && key >= node->right->key)
        return leftRotate(node);
 
    if (balance > 1 && key >= node->left->key)
    {
        node->left =  leftRotate(node->left);
        return rightRotate(node);
    }
 
    if (balance < -1 && key < node->right->key)
    {
        node->right = rightRotate(node->right);
        return leftRotate(node);
    }
 
    return node;
}
int main()
{
  struct node *root = NULL;
    int n;
    inp_d(n);
    int num_ins = 0;
    int k;
    inp_d(k);
    
    while(n--)
    {

        long int a;
        
        inp_ld(a);
        if(a>=0)
        {
            num_ins++;
            root =insert ( root, a ) ;
            
        }
        else
        {
            struct node *ans = findkthlargest(root,num_ins-k+1);
            out_ld(ans->key);
            out_nl();
        }
    }
    return 0;

  }

