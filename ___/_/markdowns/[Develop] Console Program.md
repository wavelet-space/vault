# Konzolový program

Bude číst konzolový program nějaká data ze vstupu?
Bude číst konzolový program nějaká data se souboru?

Konzolová aplikace s/bez promptu

## Co by měl obsahovat konzolová aplikace

- author
  Autor programu ve tvaru `{jméno} {příjmení} <{email}>`

- help
  Nápověda k programu a jednotlivým příkazům a přepínačům.

- version
  Aktuální verze programu ve tvaru `{major}.{minor}.{path}`

- usage

- synopsis

- config?

- options

- commands

- run

As a user I am able to see the program help because ...

    program -h | --help
    This is a help message

As a user I am able to see the program usage because ...

    program -h | --help
    ...

### `version`

As a user I am able to see the program version because ...

    Given user 
    When I type `program -v | --version`
    Then the program prints the version to the console.

Examples:
    $ program -v
    $ 1.2.3
    $ program --version

As a user I should be able to see a name of the program because ...

    program -a | --author
    David Landa

### Kroky

- Parsování vstupu do Commands a Arguments
- Parsování konfigurace
-
