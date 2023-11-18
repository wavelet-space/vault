# Architektura webové applikace

Rozhodneme jestli jde o jedno či více uživatelskou aplikaci. 

    Application = 
     | SingleUser
     | MultiUser

     | SingleAccountPerUser
     | MultipleAccountPerUser

- Account Management
- User Management
- Role Management

# Authentifikace Python Flask

## JSON Wen Tokens (JWT) 

Ideální řešení pro SPA (Single Page Application).

### Popis 

1. Klient pošle email a heslo na server.
2. Server ověří platnost emailu a hesla a v případě ověření pošle autorizační token.
3. Klient si uloží token a posílá s každým dotazem. 


### Odkazy

- https://jwt.io/