# README

Subject:
```
Il faut faire une application avec le thème "Ou aller manger entre collègues le midi"
L'idée est de faire une application Ruby on Rails avec du Stimulusjs, Hotwire/Turbo pour le front-end avec :
- Une base de données
- Un appel API externe pour récupérer de vrais restaurants
Le tout sur une infra de son choix (y a ça de gratuit au cas ou : https://render.com/)
```

## Setup

To install:
```
bundle
rake db:create
rake db:migrate
rake db:seed
```

To run:
```
bin/dev
```

To test:
```
rspec spec/*
```

## Use
The home page enables any user to access to the restaurant list (fed by seed) with their locations.
Then any user can login to create their own selection of restaurants for the day or later.

## Dependencies
* rails: `7.0.7`
* ruby: `3.1`
