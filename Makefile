BIN=test
CC=g++
#INCLUDE=-I/usr/include/hiredis -L/usr/lib -lhiredis -I/usr/include/mysql -L/usr/lib/mysql -lmysqlclient -I /home/lau/redis_connect_mysql/transferredByCpp/redisc
#INCLUDE=`mysql_config --cflags`
#LIB=`mysql_config --libs`

export LD_LIBRARY_PATH=/usr/local/lib/

export PKG_CONFIG_PATH=/usr/local/mysql/lib/pkgconfig/

INCLUDE=
LIB=`pkg-config hiredis mysqlclient --cflags --libs`

SRC=test.cpp sql_connect.cpp

$(BIN):$(SRC)
	$(CC) -o $@ $^ $(INCLUDE)  $(LIB) -g -D_DEBUG_
.PHONY:clean
clean:
	rm -rf $(BIN)
