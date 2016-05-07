CFLAGS  += -Wall -O3 -I/opt/X11/include
LFLAGS  += -L/opt/X11/lib
LIBS     = -lX11

SRCS     = $(wildcard *.c)
OBJS     = $(SRCS:.c=.o)

TARGETS  = tylock

all: $(TARGETS)

debug: CFLAGS += -g -O0
debug: all

tylock: $(OBJS)
	$(CC) $(LFLAGS) $^ -o $@ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGETS)

run: tylock
	./tylock
