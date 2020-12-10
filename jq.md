jq
==

Use `jq -C` to colorize the json, and `less -R` to output raw control characters.

```bash
jq -C . data.json | less -R
```
