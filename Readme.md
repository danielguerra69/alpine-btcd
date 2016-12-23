### BTCD for docker

## Usage

Start btcd server.

```bash
docker run -d danielguerra/alpine-btcd
```

If you want to save your data run.

```bash
docker run -v $(pwd):/home/btcd/.btcd -d danielguerra/alpine-btcd
```

For external server query use.

```bash
docker run -p 8333:8333 -p 8444:8444 -d danielguerra/alpine-btcd
```
