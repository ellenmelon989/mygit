compile runme: main.o
	@gcc -o runme main.o
run: runme
	@./runme
main.o: main.c
	@gcc -c main.c
clean:
	@rm -f *.o
	@rm -f runme