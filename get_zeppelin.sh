# Download Zeppelin from a mirror site.
wget http://shinyfeather.com/zeppelin/zeppelin-0.6.2/zeppelin-0.6.2-bin-all.tgz 

# Un-tar it.
tar -xvzf zeppelin-0.6.2-bin-all.tgz

# Rename it to zeppelin.
mv zeppelin-0.6.2-bin-all zeppelin

# Remove the tar file. Uncomment this if you'd like to remove the tar file.
#rm zeppelin-0.6.2-bin-all.tgz

# Zeppelin has a file called conf/zeppelin-site.xml.template which defines
# a sample configuration file. To make Zeppelin actually use this file, we'll
# copy it into conf/zeppelin-site.xml.
cp ./zeppelin/conf/zeppelin-site.xml.template ./zeppelin/conf/zeppelin-site.xml

# Now, we'll need to update the port that Zeppelin launches on. By default,
# the port should be 8080. This is indicated by the line <value>8080</value>
# in the conf/zeppelin-site.xml. We'll change this line to <value>8082</value>.
# It's a bit hacky, but it should work.
sed -i '' -e 's/  <value>8080<\/value>/  <value>8082<\/value>/g' ./zeppelin/conf/zeppelin-site.xml

# Now we'll get the UCI Adult dataset (https://archive.ics.uci.edu/ml/datasets/Adult)
# that our sample notebook will use.
wget https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data

# Let's create a folder for the sample notebook. The ID should match the
# value in the notebook's JSON file.
mkdir ./zeppelin/notebook/2C44QSZC4

# Fetch the notebook and put it into the correct folder.
wget https://raw.githubusercontent.com/mitdbg/modeldb-notebooks/master/scala/ModelDBSample.json -O ./zeppelin/notebook/2C44QSZC4/note.json

# Start the Zeppelin server on localhost:8082.
# Note: To stop the server, we can do ./zeppelin/bin/zeppelin-daemon.sh stop.
./zeppelin/bin/zeppelin-daemon.sh start

# Tell the user to go to localhost:8082 to find the Zeppelin notebook.
echo "Go to localhost:8082 to find ModelDB Zeppelin notebook (for Scala)."


