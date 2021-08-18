#include <unistd.h>
#include <stdio.h>
int main(void)
{
	fprintf(stderr, "Hello, kubernetes from C!\n");
	sleep(1000);
	return 0;
}
