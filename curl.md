curl
====

Uploader une image
------------------

```bash
curl -i -X POST -H "Content-Type: application/json" -d '{"email":"neolao@gmail.com","password":"coucou"}' http://localhost/api
curl -i -X POST -H "X-User-Id: 52b2c74f834d222a34000002" -H "X-Session-Token: 1fa24ea765881795564da2ac58d75a396e789cbd" -F 'avatar=@localfile.jpg' http://localhost/api
```

Uploader un fichier sans fichier
--------------------------------

```bash
myFile='{"foo": "bar"}'
curl 'https://url' -F "fileField=$myFile;filename=source.json"
```

Récupérer le code HTTP
----------------------

```bash
curl -s -o /dev/null -I -w "%{http_code}" http://website.com/
```

Temps de réponse d'une page web
-------------------------------

```bash
curl -s -w '\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\n\nTotal time:\t%{time_total}\n' -o /dev/null http://neolao.com
```

Envoyer en multipart un gros contenu
------------------------------------

`data.txt`:
```
------WebKitFormBoundaryVgWUj9nKJUzMwnMy
Content-Disposition: form-data; name="file1"

{"foo":"bar"}
------WebKitFormBoundaryVgWUj9nKJUzMwnMy
Content-Disposition: form-data; name="file2"; filename="source.xml"
Content-Type: application/xml

<foo>bar</foo>
------WebKitFormBoundaryVgWUj9nKJUzMwnMy--
```

```bash
curl -i -X POST \
  -H 'Authorization: Bearer 1234 \
  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryVgWUj9nKJUzMwnMy' \
  --data-binary @data.txt \
  http://localhost/api
```
