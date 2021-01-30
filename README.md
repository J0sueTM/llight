# llight

Simple alternative to xbacklight. Control screen brightness on linux.

# Why

My laptop do not work with the default xbacklight. Kept searching for a solution but found nothing. So I decidedd to code my own.

# How to use

Download the source code from the realeses page or clone the repository.
Give executable permissions to llight

```sh
chmod +x src/llight
```

Move it to your common PATH

```sh
mv src/llight.sh /bin/ # or /sbin/ or /opt/
```

Restart your shell, and you're good to go!

```sh
reset

llight [flags]
```

# What I learned

llight was a really quick project but I learned some stuff

- Bash
- Linux kernel structure (basic, I head to read a bunch of documents to find out what file should I change so the brightness would also change as well)

A project by Josué Teodoro Moreira
