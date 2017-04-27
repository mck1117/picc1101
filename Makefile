EXTRA_CFLAGS := -DMAX_VERBOSE_LEVEL=4

all: picc1101 

clean:
	rm -f *.o picc1101
	 

picc1101: main.o pi_cc_spi.o radio.o util.o test.o
	$(CCPREFIX)gcc $(LDFLAGS) -s -lm -lwiringPi -o picc1101 main.o pi_cc_spi.o radio.o util.o test.o

main.o: main.h main.c
	$(CCPREFIX)gcc $(CFLAGS) $(EXTRA_CFLAGS) -c -o main.o main.c

pi_cc_spi.o: main.h pi_cc_spi.h pi_cc_spi.c
	$(CCPREFIX)gcc $(CFLAGS) $(EXTRA_CFLAGS) -c -o pi_cc_spi.o pi_cc_spi.c

radio.o: main.h radio.h radio.c
	$(CCPREFIX)gcc $(CFLAGS) $(EXTRA_CFLAGS) -c -o radio.o radio.c

test.o: test.h test.c
	$(CCPREFIX)gcc $(CFLAGS) $(EXTRA_CFLAGS) -c -o test.o test.c

util.o: util.h util.c
	$(CCPREFIX)gcc $(CFLAGS) $(EXTRA_CFLAGS) -c -o util.o util.c
