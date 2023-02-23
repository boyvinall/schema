# schema

This repo is a small example of using [tbls](https://github.com/k1LoW/tbls) for doing database schema design/visualisation.
Useful if you want to kick around some ideas and have a SQL schema definition that you later use in your services.

**Note**: It uses dumb credentials for ease of use, it's not meant to be your production service!

## Dependencies

- [tbls](https://github.com/k1LoW/tbls)
- GNU make
- docker-compose

## Howto

The following will create a local postgres db, import [schema.sql](schema.sql), and use [tbls](https://github.com/k1LoW/tbls)
to generate markdown and ER diagrams:

```bash
make
```

It'll also create an [adminer](https://www.adminer.org/) container running on <http://127.0.0.1:8080>. (See [Makefile](Makefile) for the credentials.)

Other commands:

```bash
make down         # tear down the stack
make clean        # remove generated docs

make sql          # open a psql shell on the db
```
