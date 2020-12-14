# llight

Simple alternative to xbacklight. Control screen brightness on linux.

# Why

My laptop do not work with the default xbacklight. Kept searching for a solution but found nothing. So I decide to code my own.

# How to use

Download the source code from th realese page or clone the repository.
Give executable permissions to llight.sh

```sh
chmod +x src/llight.sh
```

Move it to your commom PATH

```sh
mv src/llight.sh /bin/
```

now just run it

```sh
llight.sh [flags]
```

# What I learned

llight was a really quick project but I learned some stuff

- Bash
- Linux kernel structure (basic, I head to read a bunch of documents to find out what file should I change so the brightness would also change as well)

A project by Josué Teodoro Moreira
