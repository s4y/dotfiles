#include <errno.h>
#include <stdio.h>
#include <time.h>

int main() {
	struct timespec time;
	if (clock_gettime(
#ifdef CLOCK_UPTIME_RAW
	CLOCK_UPTIME_RAW,
#else
	CLOCK_MONOTONIC,
#endif
	&time) != 0)
		return errno;
	printf("%ld\n", (time.tv_sec * 1000) + (time.tv_nsec / 1000000));
	return 0;
}
