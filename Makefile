objects = main.o sum.o  # 定义字符串，简化书写
main: $(objects)      #指定依赖文件
	gcc -o mainsum $^ 

%.o: %.c       # 第二行解析了字符串，就知道是依赖于main和sum了，这里就会匹配上了
	gcc -c $<  

.PHONY : clean #如果当前路径有一个叫clean的文件 make clean则无法执行，PHONY标记后会直接执行clean命令，而不是先查找再执行
clean:
	rm *.o
	rm mainsum