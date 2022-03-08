# Mapa Ecuador

## Tabla de contenidos 
1. [Información General](#general-info)
3. [Mapa del Ecuador](#mapa-ecuador)
4. [Análisis de sentimientos en Twitter](#twitter)

<a name="general-info"></a>
### Información General
Dentro de este repositorio se encuentran dos programas escritos en R para el análisis de datos.

* <code>mapa_Ecuador2.R</code> - *Mapa del Ecuador*
* <code>twitter-analysis.R</code> - *Análisis de sentimientos en Twitter*

<a name="mapa-ecuador"></a>
### Mapa del Ecuador
Este script permite realizar un gráfico a partir de un archivo ```.shp``` con el mapa del Ecuador y sus respectivas provincias.
El mapa fue obtenido desde el siguiente [enlace](https://franzpc.com/descargar-shapefiles-shp-ecuador/)

Una vez descargado, solo se tiene que referenciar la carpeta donde se descomprimieron los archivos necesarios en la línea 12.
``` 
dirmapa <- ""
```

Así mismo, se tiene que descargar un archivo ```.csv``` con datos de los mercados mayoristas ecuatorianos. 
El conjunto de datos utilizado fue obtenido desde el siguiente [enlace](https://datosabiertos.planificacion.gob.ec/dataset/precios-monitoreado-de-productos-en-mercados-mayoristas-a-nivel-nacional/resource/ccf00a9f-06d3-4ce0-bdb1-4409e5111281)

Una vez descargado, solo se tiene que referenciar la carpeta donde se descomprimió el conjunto de datos en la línea 33.
``` 
mercado_mayorista <- fread("", sep = ";", encoding = "Latin-1")
```
<a name="twitter"></a>
### Análisis de sentimientos en Twitter
Este script permite realizar el análisis de sentimientos respecto a la guerra de Ucrania hasta el día 28 de Febrero de 2022.
El conjunto de datos fue obtenido desde el siguiente [enlace](https://www.kaggle.com/towhidultonmoy/russia-vs-ukraine-tweets-datasetdaily-updated/metadata)
El conjunto de palabras positivas y negativas utlizado fue obtenido desde el siguiente [enlace](https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon).
#### Referencias:
* [Chapter 33 Twitter sentiment analysis in R](https://jtr13.github.io/cc21/twitter-sentiment-analysis-in-r.html)
* "Minqing Hu and Bing Liu. "Mining and Summarizing Customer Reviews." 
Proceedings of the ACM SIGKDD International Conference on Knowledge 
Discovery and Data Mining (KDD-2004), Aug 22-25, 2004, Seattle, 
Washington, USA."

Una vez descargados los datos, se referencia la ruta donde se descomprimieron en la línea 8.
```
tweets <- read_csv("")
```

Para las palabras que se utilizarán se debe referenciar la ruta en las líneas 46 y 47 respectivamente.
```
positive = scan('../words/opinion-lexicon-English/positive-words.txt', what = 'character', comment.char = ';')
negative = scan('../words/opinion-lexicon-English/positive-words.txt', what = 'character', comment.char = ';')
```

## Autores:
- [Alex Aguacondo](https://github.com/AlexAgTa)