# Publikování TypeScript projektu jako npm balíček

## Zdroje

- https://codeburst.io/https-chidume-nnamdi-com-npm-module-in-typescript-12b3b22f0724

## Postup

Vygenerovaný `tsconfig.json` by měl obsahovat:

```json
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "declaration": true,
    "outDir": "./dist",
    "strict": true
  }
}
```

- "target": "es5" -- Cílový ECMAScript verze: ES3 (default), "ES5", "ES2015", "ES2016", "ES2017","ESNEXT".
- "module": commonjs" -- Cílový modulový systém: "none", commonjs’, "amd", "system", "umd", "es2015", or "ESNext".
- "declaration": true -- Generuj příslušné `.d.ts` soubory.
- "outDir": "./dist" -- Výstupní adresář pro `js` a jiné soubory.

## Setting up GitHub packages for NPM

## Publish

### Publish to git repository

    git add .
    git commit -m "Commit message"
    git tag v1.0.1
    git push origin master --tags

### Publish to npm

#### Step 1: Use `publishConfig` option in your package.json

    "publishConfig": { "registry": "https://npm.pkg.github.com/" }

#### Step 2: Authenticate

    $ npm login --registry=https://npm.pkg.github.com/

#### Step 3: Publish

    $ npm publish

## Install

First of all, add a .npmrc in the root of your project.
@yourcompany:registry=https://npm.pkg.github.com

This tells npm to install any packages with a name space of @yourcompany from Github Packages.

## GitHub Token

On page https://github.com/settings/tokens generate token and safely store your password
