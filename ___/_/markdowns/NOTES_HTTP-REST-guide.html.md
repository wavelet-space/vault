<!DOCTYPE html>
<head>
  <meta charset="utf8">
  <link rel="stylesheet" type="text/css" href="./assets/main.css">
  <title></title>
</head>
<body>

<div id="container">

<header>HEADER</header>

<!-- CONTENT -->
<div id="main" class="left-content">
# HTTP

## HTTP Method

### Safe Method

Safe HTTP method MUST NOT change anything on the server side (GET, HEAD, OPTIONS,...)

### Idempotent Method

Idempotent method represents operation which:
- For the same input data produce same result, regardless how many times is executed
- Can modify resource, but those modification should not change resource representation???

More information here: http://restcookbook.com/HTTP%20Methods/idempotency

### GET

### HEAD

### POST

### PATCH

### DELETE

### PUT

### OPTIONS


## HTTP Status Code





### HTTP 2xx (Success)

#### Overview

| Code | Meaning         |
|:-----|:----------------|
| 200  | Ok              |
| 201  | Created         |
| 202  | Accepted        |
| 204  | No Content      |
| 206  | Partial Content |


#### 200 (Ok)


#### 201 (Created)

HTTP 200 (Ok) Status Code SHOULD be used after a successful POST creation request.
The response SHOULD include the `Location` header with link currently created resource.

Examples:
    
    ...

#### 202 (Accepted)

HTTP 202 (Accepted) Status Code SHOULD be used after a request has been accepted but the processing has NOT been completed.

Useful for asynchronous and long running operations -- the operation is not immediate.

- Batch
- Delete

Examples:
    
    ...


#### 204 (No Content)

HTTP 204 (No Content) Status Code SHOULD be used after a request has been accepted but no content is returned.




#### 206 (Partial Content)

 

### 3xx (Redirection)



### 4xx Client Error

### 5xx Server Error


### HTTP Headers


###


# CRUD


## Single Item

### Create Single Item

Create (retrieve) a single item.

    POST /users

### Retrieve Single Item

Retrieve the single item.

    GET /users/1

### Update Single Item

### Delete Single Items

    DELETE users/1



## Collection of Items

### Create Collection of Items

### Retrieve Collection of Items

### Delete Collection of Items

https://stackoverflow.com/questions/4954134/rest-deleting-a-collection-of-objects


# REST

## Resource

e.g `/users`

DO NOT try to create 1:1 mapping between your domain or even database model and REST resources. How Domain Driven Design concepts, especially aggregate and bounded context, are related to REST see the [FIXME].

### Naming  

- Resource name MUST be in plural form.

        /users/

- Resource name MUST be noun, not a verb.
    
    GOOD
    
        POST /users

    BAD

        /create-user

- Resource name MUST be in in kebab-case
  
  Reason: To easily distinguish between URI path elements and query parameters.

- Resource SHOULD have concrete name.

  Suppose that an application manages contracts of different types. Assuming that each contract type has many specificities (e.g., different relationships with other concepts), it would actually be bad from a design perspective to create a "contracts" resource as that would force you to manage all the contract details within the representation. Instead, you could have specific resources for each contract type. 


### Use sub-resources for relations


    /users/{:id}/posts


MUST Avoid trailing slash
The trailing slash must not be used.


# REST API Guide

Latest published version: HTML, PDF


## Purpouse

Welcome, this is a REST API guide!

## Conventions

Semantics, Formatting, Naming

The keywords `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, `OPTIONAL` has meaning as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt)

| Keyword      | Meaning              |
|:-------------|:---------------------|
| MUST         | It's mandatory       |
| MUST NOT     | It's forbidden       |
| SHOULD       | It's recommended     |
| SHOULD NOT   | It's not recommended |
| MAY/OPTIONAL | It's optional        |


## Table of Contents

- HATEOS Hypermedia as the Engine of Application State

- HTTP
- REST


### Paging

### Filtering

Return a sequence of users  
    GET /users?age=33
    GET /users?age<=33

### Sorting 

### Searching

### Field Selection





### Query Parameters

q
sort
fields
offset
cursor
limit


## Resources

- https://github.com/allegro/restapi-guideline
- https://allegro-restapi-guideline.readthedocs.io
- https://github.com/NationalBankBelgium/REST-API-Design-Guide/wiki
- https://github.com/paypal/api-standards
- https://rozvoj.fit.cvut.cz/Main/Uzitecne-odkazy-REST

## Contribute

See the contributing file.

## License

Creative Commons


# HTTP Cheatsheet

HTTP Hypertext Transfer Protocol

## Client & Server \(architektura\)

HTTP je bezestavový protokol, protože mezi jednotlivými dotazi musí poslat serveru všechny potřebné informace k přístupu ke zdrojům.

## Charakteristika HTTP protokolu

#### Conectionless

HTTP protokol nevyžaduje kontinuální spojení mezi dvěma komunikující stranami. Vše probíha na bázi dotazu a odpovědi.  
Vše mezi další komunikací je zapomenuto, což souvisí s další vlastností níže.

#### Stateless

HTTP protokol neuchovává mezi dvěma dotazy žádné informace.  
říkáme že protokol je bezestavový. Vše co patří k jednomu dotazu, musí být tedy přítomno a nelze se spoléhat na jakékoliv dodatečné infomrace předané předchozími dotazy.

#### Media independent

HTTP protokol umožnuje mezi klientem posílat jakýkoliv druh zprávy, pokud oba ho oba znají a tedy umějí interpretovat. Toho docílíme tak, že každá zpráva má přidělen tzv. MIME typ, který je přiřazen ke zprávě. Více si povíme v sekci o HTTP hlavičkách.

## HTTP Message

## HTTP Request

## HTTP Response

## HTTP Header & Field

## HTTP Method

## HTTP Status Code

## HTTP Caching

## HTTP URL Encoding

**Přihlášení uživatele pomocí HTTP aby měl přístup do soukromých sekcí aplikace.**

HTTP basic authentization  
Pošleme hlavičku s polem AUthorization, které obsahuje username:password v Base64

```
GET / HTTP/1.1
Host: example.org
Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQ=
```

Zkuste si sami: [https://www.base64encode.org/](https://www.base64encode.org/)

---

# REST Cheatsheet

**Co je to HATEOAS?**

### K čemu je CURL...

### HTTP a REST

Pro jednoduchost budeme používat online službu [http://jsonplaceholder.typicode.com/](http://jsonplaceholder.typicode.com/). Ta je postavena nad programem \[JSON Server\]\([https://github.com/typicode/json-server\](https://github.com/typicode/json-server\)\), který nám poskytuje jednoducé API a data v JSON formátu pro snadné testování.

Pro jednoduché zkoušení a učení se  HTTP můžeme použít [http://httpbin.org/](http://httpbin.org/)

### GET

```bash
curl -X GET http://jsonplaceholder.typicode.com/posts/1
```

### POST

```
culr -X POST ...
```

### PUT

```
curl -X PUT
```

### PATH

```
curl -X PATH
```

### DELETE

```
curl -X DELETE
```

# HTTP REST CheatScheet

http://restcookbook.com/

## Návrh a Dokumentace

Pro návrh a dokumentaci API můžeme použít swagger: http://swagger.io/swagger-editor/

Dlouho běžící procesy pomocí RESTu vytváříme takto.

Namísto statusu 201 (Created) vracíme status `202` (Accepted)

REQUEST

## Testování

Postman https://www.getpostman.com/
Insomnia https://insomnia.rest/

# Filtering, Sorting, Ordering, Paging v REST API

Proč?

Jak?
  
parametr `limit`

paramter `offset`

parametr `next`
parametr `prev`

Expanze v REST API

https://developer.atlassian.com/server/confluence/pagination-in-the-rest-api/
https://developer.atlassian.com/server/confluence/expansions-in-the-rest-api/

</div> <!-- /container -->

<script type="text/javascript" defer src="./assets/markjax.min.js"></script>
<script type="text/javascript" defer src="./assets/main.js"></script>
</body>
</html>