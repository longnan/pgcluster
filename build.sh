VER=`cat version.txt`
# remove volumes so we start from scratch
sudo docker volume ls | grep pgcluster | awk '{print $2}' | xargs sudo docker volume rm
sudo docker build -t pg:${VER} --no-cache=false -f postgres/Dockerfile.supervisor ./postgres
#if [ $? -eq 0 ] ; then
# echo pushing to local registry
# sudo docker tag pg:$VER localhost:5000/pg:$VER
# sudo docker push localhost:5000/pg:$VER
#fi
sudo docker build -t pgpool:${VER} -f pgpool/Dockerfile ./pgpool
#if [ $? -eq 0 ] ; then
# echo pushing to local registry
# sudo docker tag pgpool:$VER localhost:5000/pgpool:$VER
# sudo docker push localhost:5000/pgpool:$VER
#fi
#TO do: add the manager
thisdir=$(pwd)
cd manager/build
./build.bash
cd $thisdir
