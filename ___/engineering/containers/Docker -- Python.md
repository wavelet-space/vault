## Docker Python

https://dockerlabs.collabnix.com/

Pokud instalujeme nějaký balík z Git repozitáře musíme instalovat Git.

**Ubuntu/Debian**

```dockerfile
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
```

**Alpine**

```dockerfile
RUN apt add git
```

Pokud potřebujeme kompilocat nějaké balíky, musíme instalova gcc toolchain.

**Alpine**

```dockerfile
RUN apk add --no-cache  gcc musl-dev linux-headers
```
