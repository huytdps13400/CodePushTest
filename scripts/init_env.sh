if [ -f ./env/.ota ]; 
then
    # Load Environment Variables
    export $(cat ./env/.ota | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
else
    echo "Environment file not found"   
fi