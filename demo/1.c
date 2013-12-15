#include <stdio.h>

int adds32(int x, int y)
{
	// CHECK: @trap.sadd.i32(i32 %x, i32 %y)
	// CHECK: add nsw i32 %x, %y
	return x + y;
}

unsigned long long addu64(unsigned long long x, unsigned long long y)
{
	// CHECK: @trap.uadd.i64(i64 %x, i64 %y)
	// CHECK: add i64 %x, %y
	return x + y;
}

unsigned int mul2(unsigned int x)
{
	if(x<0xfffffffe)
		return x*2;
	else
		return 0;
}

int main()
{
	int x=0,y=0;
	int result=0;
	scanf("%d%d",&x,&y);
	result=adds32(x,y);
	printf("\n%d\n",result);
	return 0;
}
