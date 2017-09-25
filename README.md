[![GitHub stars](https://img.shields.io/github/stars/veerendra2/searx-with-dnscrypt.svg)](https://github.com/veerendra2/searx-with-dnscrypt/stargazers)
[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://raw.githubusercontent.com/veerendra2/searx-with-dnscrypt/master/LICENSE)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/veerendra2/searx-with-dnscrypt.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=%5Bobject%20Object%5D)
# Searx with dnscrypt in Docker
This repository is meant to build the base image for a `searx-with-dnscrypt` container.

Repo website - https://veerendra2.github.io/searx-with-dnscrypt/
## What the heck is Searx?
Searx is a free metasearch engine with the aim of protecting the privacy of its users.To this end, Searx does not share users' IP addresses or search history with the search engines it gathers results from. Tracking cookies served by the search engines are blocked, preventing user-profiling-based results modification. By default, Searx queries are submitted via HTTP POST, to prevent users' query keywords from appearing in webserver logs. Searx was inspired by the Seeks project, though it does not implement Seeks' peer-to-peer user-sourced results ranking.[continue on wikipedia](https://en.wikipedia.org/wiki/Searx)
   * Offical repo - https://github.com/asciimoo/searx
   * Documentation - https://github.com/asciimoo/searx/wiki
   * Website - https://asciimoo.github.io/searx/
   * Searx search engine site - https://www.searx.me/
## What the heck is dnscrypt?
DNSCrypt is a protocol that authenticates communications between a DNS client and a DNS resolver. It prevents DNS spoofing. It uses cryptographic signatures to verify that responses originate from the chosen DNS resolver and haven't been tampered with.https://dnscrypt.org/
  * Offical repo - https://github.com/jedisct1/dnscrypt-proxy
  * Documentation - https://github.com/jedisct1/dnscrypt-proxy/wiki
  * Website - https://dnscrypt.org/

## Why the heck I combined those two?
Just for fun and provide better anommous internet surfing. All your DNS queries "from" `Searx` container is encrypted which prevents DNS spoofing + Provides basic privacy by mixing your queries with searches on other platforms without storing search data
   * ### What it can't do
     Your DNS queries won't encrypt if you directly type the URL of website(To do that, check [here](https://github.com/veerendra2/useless-scripts#5-dsncrypt-autopy)). Since the `dnscrypt-proxy` is only in this container, it can encrypts DNS queries of the links in results which you click.

## Run it
`sudo docker run -d --name searx-dnscrypt -p 8888:8888 --dns=127.0.0.1 --restart always veerendrav2/searx-with-dnscrypt`
   * `--dns=127.0.0.1` - Because `dnscrypt` binds on loopback address
   * `--restart always` - Docker engine starts the container whenever machine boots
   * You can access `Searx` at http://127.0.0.1:8888

## NOTE
* Normal DNS servers(for e.g. Google's 8.8.8.8) won't support `Dnscrypt`. So there are some list of server that supports `Dnscrypt` protocol which you can get [here](https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv).
* In this Dockerfile I used [soltysiak](https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv#L98) which supports `NO LOG` policy and `DNSSEC`(Authentication)
* To configure dnscrypt in your machine, check intructions [here](https://github.com/veerendra2/useless-scripts#5-dsncrypt-autopy)

Courtesy: This is repository is base on [wonderfall/searx](https://github.com/Wonderfall/dockerfiles/tree/master/searx). 
