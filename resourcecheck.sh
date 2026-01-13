SEC_LIMIT=240
CHECK_PERIOD=5

for ((loop=0 ; loop < SEC_LIMIT ; loop++));
do
    sleep CHECK_PERIOD
    free -h >> result.log
done