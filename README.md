# transproxy-config

```
PREROUTING -> local process -> OUTPUT -> go-transproxy -> squid4 -> corporate proxy(with auth)
```

1. Install squid4
2. Edit `/etc/squid/squid.conf` ([add this config](squid.conf))
3. Restart squid4
4. Install [go-transproxy](https://github.com/wadahiro/go-transproxy)
5. Enable routing ([run this script](enable-routing.sh))
