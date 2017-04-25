# Logstash

## Performance testing

```bash
docker run -it --rm --name elasticsearch -p 9200:9200 -p 9300:9300 elasticsearch:2.4.1 --network.publish_host=0.0.0.0 --discovery.zen.ping.multicast=false --index.number_of_shards=1 --index.number_of_replicas=0
```

```bash
docker run -it --rm -p 31311:31311 -p 5044:5044 --name=logstash --link=elasticsearch -e "ELASTICSEARCH_NODES=[\"elasticsearch:9200\"]" alpine-logstash-efset
```

## Without geoip filter

```bash
vegeta λ echo "POST http://localhost:31311" | vegeta attack -keepalive=false -duration=60s -body=exp1604.json -rate=50 -header="Content-Type: application/json" | tee results.bin | vegeta report
Requests      [total, rate]            3000, 50.02
Duration      [total, attack, wait]    59.983775068s, 59.979999733s, 3.775335ms
Latencies     [mean, 50, 95, 99, max]  5.433011ms, 4.890231ms, 8.236689ms, 13.946552ms, 167.600349ms
Bytes In      [total, mean]            6000, 2.00
Bytes Out     [total, mean]            360000, 120.00
Success       [ratio]                  100.00%
Status Codes  [code:count]             200:3000
Error Set:
```

## With geoip filter

```bash
vegeta λ echo "POST http://localhost:31311" | vegeta attack -keepalive=false -duration=60s -body=exp1604.json -rate=50 -header="Content-Type: application/json" | tee results.bin | vegeta report
Requests      [total, rate]            3000, 50.02
Duration      [total, attack, wait]    59.984221974s, 59.97999997s, 4.222004ms
Latencies     [mean, 50, 95, 99, max]  15.000906ms, 5.50794ms, 43.453162ms, 254.86525ms, 673.671025ms
Bytes In      [total, mean]            6000, 2.00
Bytes Out     [total, mean]            360000, 120.00
Success       [ratio]                  100.00%
Status Codes  [code:count]             200:3000
Error Set:
```
