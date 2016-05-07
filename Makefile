CFLAGS  += -Wall -O3 -I/opt/X11/include
LFLAGS  += -L/opt/X11/lib -lX11

SRCS     = $(wildcard *.c)
OBJS     = $(SRCS:.c=.o)

TARGETS  = tylock

all: $(TARGETS)

debug: CFLAGS += -g -O0
debug: all

tylock: $(OBJS)
	$(CC) $(LFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGETS)

run: tylock
	./tylock
