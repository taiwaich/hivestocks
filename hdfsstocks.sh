if hdfs dfs -test -d /stocks;
then
	hdfs dfs -ls /stocks/	
else
	hdfs dfs -mkdir /stocks/
	hdfs dfs -put *.csv /stocks/
	hdfs dfs -ls /stocks/	
fi
