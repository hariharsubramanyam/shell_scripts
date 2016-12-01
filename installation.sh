# Install some dependencies.
sudo apt-get update
sudo apt-get install maven git sqlite default-jre default-jdk python policycoreutils libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev make

# Install thrift.
cd /tmp
curl http://archive.apache.org/dist/thrift/0.9.3/thrift-0.9.3.tar.gz | tar zx
cd thrift-0.9.3/
./configure
make
sudo make install
thrift --help
cd

# Install SQLite
wget http://www.sqlite.org/2016/sqlite-autoconf-3150100.tar.gz
tar -xvzf sqlite-autoconf-3150100.tar.gz
mv sqlite-autoconf-3150100 sqlite
cd sqlite
./configure
make
sudo make install
sudo mv sqlite3 /usr/bin/
cd

# Install SBT
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

# Install Spark
wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
tar -xvzf spark-2.0.0-bin-hadoop2.7.tgz
mv spark-2.0.0-bin-hadoop2.7 spark
export PATH=~/spark/sbin:$PATH
export PATH=~/spark/bin:$PATH

# Get the code
wget http://www.mit.edu/~hsubrama/modeldb.tar.gz
tar -xvzf modeldb.tar.gz

# Get the datasets
wget http://www.mit.edu/~hsubrama/datasets/movie_metadata.csv
wget http://www.mit.edu/~hsubrama/datasets/house.csv
wget http://www.mit.edu/~hsubrama/datasets/animal.csv

# Run the evaluation
setenforce 0
cd ./modeldb/client/scala/libs/spark.ml
./full_evaluation.sh ~/evaluation ~/movie_metadata.csv ~/animal.csv ~/house.csv
