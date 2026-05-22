---
outputs:
- Reveal
title: Mejores paquetes
hidden: true
layout: list
weight: 11
output: hugodown::md_document
countdown: true
rmd_hash: 9fb31643aa86da56

---

# Mejores paquetes

<div class="highlight">

</div>

<div class="highlight">

{{< figure src="3697811.jpeg" alt="Red rocket ship" caption="Foto de [Matheus Bertelli en Pexels](https://www.pexels.com/photo/editorial-photo-of-red-rocket-ship-3697811/)." width="250" >}}

</div>

------------------------------------------------------------------------

## Qué es buen código

> La única forma de escribir buen código es escribir primero toneladas de código de mierda. Sentir vergüenza por el código malo te impide llegar al código bueno.

[Traducción de una entrada en Mastodon de Hadley Wickham](https://fosstodon.org/@hadleywickham/112021309035884210)

------------------------------------------------------------------------

## Taller de hoy

Presentaré una colección de cosas muy útiles que he aprendido en los últimos años.

Después de cada sección haré un resumen y te pediré que comentes.

Después, elige una cosa para mejorar en tu paquete.

------------------------------------------------------------------------

## Recordatorios

:sleeping_face: Lo vimos en <https://codigo-hermoso.netlify.app/>

------------------------------------------------------------------------

## Interfaz

------------------------------------------------------------------------

### Mensajes agradables

Conoce al [paquete cli](https://blog.r-hub.io/2023/11/30/cliff-notes-about-cli/)

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>variable</span> <span class='o'>&lt;-</span> <span class='m'>42</span></span>
<span><span class='nf'>cli</span><span class='nf'>::</span><span class='nf'><a href='https://cli.r-lib.org/reference/cli_alert.html'>cli_alert_info</a></span><span class='o'>(</span><span class='s'>"Set &#123;.field parameter&#125; to &#123;.val &#123;variable&#125;&#125;"</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; <span style='color: #00BBBB;'>ℹ</span> Set <span style='color: #00BB00;'>parameter</span> to <span style='color: #0000BB;'>42</span></span></span>
<span></span></code></pre>

</div>

[Viñeta para migrar de las funciones usethis::ui a cli](https://cli.r-lib.org/articles/usethis-ui.html)

[Viñeta sobre "clases" de formatos](https://cli.r-lib.org/reference/inline-markup.html)

------------------------------------------------------------------------

### Bonitos mensajes

¿Cómo controlar la verbosidad?

-   argumento en cada función :weary:

-   [opción global à la `usethis.quiet`](https://ropensci.org/blog/2024/02/06/verbosity-control-packages/)

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>cli_alert_info</span> <span class='o'>&lt;-</span> <span class='kr'>function</span><span class='o'>(</span><span class='nv'>...</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='kr'>if</span> <span class='o'>(</span><span class='o'>!</span><span class='nf'><a href='https://rdrr.io/r/base/options.html'>getOption</a></span><span class='o'>(</span><span class='s'>"usethis.quiet"</span>, default <span class='o'>=</span> <span class='kc'>FALSE</span><span class='o'>)</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>    <span class='nf'>cli</span><span class='nf'>::</span><span class='nf'><a href='https://cli.r-lib.org/reference/cli_alert.html'>cli_alert_info</a></span><span class='o'>(</span><span class='nv'>...</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span></span>
<span><span class='o'>&#125;</span></span></code></pre>

</div>

------------------------------------------------------------------------

### Bonitos mensajes

Para leer más: <https://ropensci.org/blog/2024/02/06/verbosity-control-packages/>

*:toolbox: ¿Hay mensajes en tu paquete que podrías mejorar?*

------------------------------------------------------------------------

### Mensajes de error

-   Consejos sobre el contenido en el [guía de estilo de tidyverse](https://style.tidyverse.org/error-messages.html) con ejemplos.

-   Interfaz con [`cli::cli_abort()`](https://cli.r-lib.org/reference/cli_abort.html)

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>cli</span><span class='nf'>::</span><span class='nf'><a href='https://cli.r-lib.org/reference/cli_abort.html'>cli_abort</a></span><span class='o'>(</span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span></span>
<span>    <span class='s'>"Can't find good error message."</span>,</span>
<span>    i <span class='o'>=</span> <span class='s'>"Read the tidyverse style guide."</span></span>
<span>  <span class='o'>)</span></span>
<span><span class='o'>)</span></span>
<span><span class='c'>#&gt; <span style='color: #BBBB00; font-weight: bold;'>Error</span><span style='font-weight: bold;'> in `.f()`:</span></span></span>
<span><span class='c'>#&gt; <span style='color: #BBBB00;'>!</span> Can't find good error message.</span></span>
<span><span class='c'>#&gt; <span style='color: #00BBBB;'>ℹ</span> Read the tidyverse style guide.</span></span>
<span></span></code></pre>

</div>

------------------------------------------------------------------------

### Mensajes de error

*:toolbox: Revisa los mensajes de error de tu paquete (busca [`stop()`](https://rdrr.io/r/base/stop.html) y equivalentes). ¿Podrían mejorarse algunos de ellos aplicando la guía de la tidyverse?*

Tal vez con AI: <https://simonpcouch.github.io/chores/reference/cli_helper.html>

------------------------------------------------------------------------

### Comprobación de argumentos

-   Documenta el tipo de argumento.

-   Comprueba los argumentos. [`rlang::arg_match()`](https://rlang.r-lib.org/reference/arg_match.html) por ejemplo.

Más información: [Comprobar las entradas de tus funciones en R](https://blog.r-hub.io/2022/03/10/input-checking/) por Hugo Gruson , Sam Abbott , Carl Pearson.

------------------------------------------------------------------------

### Comprobación de argumentos

*:toolbox: ¿Tu paquete documenta y valida los argumentos? Mejora esto en una sola función o más.*

------------------------------------------------------------------------

## Interfaz :microphone: `stop()` :microphone:

-   Bonitos mensajes con {cli}.
-   Mensajes de error con {cli}, guía de tidyverse.
-   Comprobación de argumentos con rlang, entrada del blog R-hub.

------------------------------------------------------------------------

## Interfaz :microphone: `stop()` :microphone:

-   Bonitos mensajes con {cli}.
-   Mensajes de error con {cli}, guía de tidyverse.
-   Comprobación de argumentos con rlang, entrada del blog R-hub.

Por favor, publícalo en el chat

-   ¡Algo que te haya parecido interesante!
-   ¡Algo con lo que no estabas de acuerdo!
-   ¿Una experiencia buena/mala reciente con estas herramientas?

------------------------------------------------------------------------

## Menos código o menos dolores de cabeza

------------------------------------------------------------------------

### Sopesa tus dependencias

¿Esta dependencia provoca alegría? :wink:

-   Una dependencia es un código que otra persona ha elaborado y probado cuidadosamente.
-   Una dependencia es un punto de fallo.

Más información: [Dependencias: Mentalidad y antecedentes](https://r-pkgs.org/dependencies-mindset-background.html) en el libro R Packages de Hadley Wickham y Jenny Bryan.

------------------------------------------------------------------------

### Sopesa tus dependencias

En la [Guía de desarrollo de rOpenSci](https://devguide.ropensci.org/building.html#recommended-scaffolding)

-   curl, httr2, crul, httr. No RCurl. Para un nuevo paquete, httr2 en vez de httr.

-   jsonlite. No rjson ni RJSONIO.

-   xml2. No XML

-   sf, suites espaciales desarrolladas por las comunidades r-spatial y rspatial. No sp, rgdal, maptools, rgeos.

------------------------------------------------------------------------

### Sopesa tus dependencias

Evaluar la actividad en GitHub de los colaboradores

<https://ropensci.org/es/blog/2022/07/01/evaluating-github-activity-for-contributors/>

------------------------------------------------------------------------

### Sopesa tus dependencias

*:toolbox: ¿Hay dependencias que podrías añadir, sustituir o eliminar en tu paquete?*

------------------------------------------------------------------------

### ¿Menos código? Más allá del uso de dependencias

Feature creep: "ampliación o adición excesiva y continua de nuevas funciones en un producto" <https://en.wikipedia.org/wiki/Feature_creep>

Está bien dividir el paquete.

Está bien decir no a las peticiones de funciones. [Ejemplo](https://github.com/r-lib/pkgdown/issues/1430#issuecomment-924268834)

------------------------------------------------------------------------

### Menos código

*:toolbox: ¿Hay peticiones de funciones a las que te gustaría decir que no? Guardar respuesta como [Respuesta GitHub](https://docs.github.com/en/get-started/writing-on-github/working-with-saved-replies/creating-a-saved-reply)?*

------------------------------------------------------------------------

## Menos código :microphone: `stop()` :microphone:

-   Elegir dependencias.
-   Dependencias a evitar.
-   Definir el ámbito del paquete.

------------------------------------------------------------------------

## Menos código :microphone: `stop()` :microphone:

-   Elegir dependencias.
-   Dependencias a evitar.
-   Definir el ámbito del paquete.

Por favor, publícalo en el chat

-   ¡Algo que te haya parecido interesante!
-   ¡Algo con lo que no estabas de acuerdo!
-   ¿Una experiencia buena/mala reciente con estas herramientas?

------------------------------------------------------------------------

## Código

------------------------------------------------------------------------

### :sleeping_face: Código lo más simple posible: "early return"

:eyes:

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>do_this</span> <span class='o'>&lt;-</span> <span class='kr'>function</span><span class='o'>(</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='kr'>if</span> <span class='o'>(</span><span class='o'>!</span><span class='nf'>is_that_present</span><span class='o'>(</span><span class='o'>)</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>    <span class='kr'><a href='https://rdrr.io/r/base/function.html'>return</a></span><span class='o'>(</span><span class='kc'>NULL</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span> <span class='kr'>else</span> <span class='o'>&#123;</span></span>
<span>    <span class='c'># more code</span></span>
<span>    <span class='kr'><a href='https://rdrr.io/r/base/function.html'>return</a></span><span class='o'>(</span><span class='nv'>blip</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span></span>
<span><span class='o'>&#125;</span></span>
<span></span></code></pre>

</div>

------------------------------------------------------------------------

### Código lo más simple posible: "early return"

:sparkles:

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>do_this</span> <span class='o'>&lt;-</span> <span class='kr'>function</span><span class='o'>(</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='kr'>if</span> <span class='o'>(</span><span class='o'>!</span><span class='nf'>is_that_present</span><span class='o'>(</span><span class='o'>)</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>    <span class='kr'><a href='https://rdrr.io/r/base/function.html'>return</a></span><span class='o'>(</span><span class='kc'>NULL</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span></span>
<span>  <span class='c'># more code</span></span>
<span></span>
<span>  <span class='nv'>blip</span></span>
<span><span class='o'>&#125;</span></span>
<span></span></code></pre>

</div>

------------------------------------------------------------------------

### :sleeping_face: Código lo más sencillo posible: `switch()`

:eyes:

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'>if</span> <span class='o'>(</span><span class='nv'>type</span> <span class='o'>==</span> <span class='s'>"mean"</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='o'>(</span><span class='nv'>x</span><span class='o'>)</span></span>
<span><span class='o'>&#125;</span> <span class='kr'>else</span> <span class='kr'>if</span> <span class='o'>(</span><span class='nv'>type</span> <span class='o'>==</span> <span class='s'>"median"</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/stats/median.html'>median</a></span><span class='o'>(</span><span class='nv'>x</span><span class='o'>)</span></span>
<span><span class='o'>&#125;</span> <span class='kr'>else</span> <span class='kr'>if</span> <span class='o'>(</span><span class='nv'>type</span> <span class='o'>==</span> <span class='s'>"trimmed"</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='o'>(</span><span class='nv'>x</span>, trim <span class='o'>=</span> <span class='m'>.1</span><span class='o'>)</span></span>
<span><span class='o'>&#125;</span></span></code></pre>

</div>

------------------------------------------------------------------------

### Código lo más sencillo posible: `switch()`

:sparkles:

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'><a href='https://rdrr.io/r/base/switch.html'>switch</a></span><span class='o'>(</span></span>
<span>  <span class='nv'>type</span>,</span>
<span>  mean <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='o'>(</span><span class='nv'>x</span><span class='o'>)</span>,</span>
<span>  median <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/stats/median.html'>median</a></span><span class='o'>(</span><span class='nv'>x</span><span class='o'>)</span>,</span>
<span>  trimmed <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='o'>(</span><span class='nv'>x</span>, trim <span class='o'>=</span> <span class='m'>.1</span><span class='o'>)</span></span>
<span><span class='o'>)</span></span>
<span></span></code></pre>

</div>

------------------------------------------------------------------------

### Código lo más simple posible: lógica

Para leer más: [El código huele y se siente](https://github.com/jennybc/code-smells-and-feels) por Jenny Bryan

*:toolbox: Examina la lógica de una o varias funciones. ¿Podrías simplificarla con retornos anticipados, funciones auxiliares? ¿Cambiar la ordén de las condiciones de ifelse?*

------------------------------------------------------------------------

## :sleeping_face: Menos dolores de cabeza: lintr+flir

[lintr](https://lintr.r-lib.org/index.html) encuentra problemas en código.

[flir](https://flir.etiennebacher.com/) también, puede reparar algunos.

Para leer más: [Cómo uso lintr](https://masalmon.eu/2024/08/28/lintr-3-steps/) en mi blog.

*:toolbox: Intenta mejorar tu paquete con flir y/o lintr*

------------------------------------------------------------------------

### :sleeping_face: Estética del código

Algunos de ellos sólo son relevantes si ves código.

-   ¿Usar alineación?
-   Utiliza párrafos
-   Utiliza comentarios de "cabecera" para la navegación.

------------------------------------------------------------------------

#### :sleeping_face: Alineación de códigos

-   Alinea los argumentos en las definiciones de función.

-   ¿Más alineación vertical? No soy sensible a ello :innocent:

------------------------------------------------------------------------

#### :sleeping_face: Párrafos

Un párrafo = una idea (¡también sirve para escribir prosa!).

El espacio vertical es costoso (¿qué cabe en la pantalla?)

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>head</span> <span class='o'>&lt;-</span> <span class='nf'>collect_metadata</span><span class='o'>(</span><span class='nv'>website</span><span class='o'>)</span></span>
<span><span class='nv'>head_string</span> <span class='o'>&lt;-</span> <span class='nf'>stringify</span><span class='o'>(</span><span class='nv'>head</span><span class='o'>)</span></span>
<span></span>
<span><span class='nv'>body</span> <span class='o'>&lt;-</span> <span class='nf'>create_content</span><span class='o'>(</span><span class='nv'>website</span><span class='o'>)</span></span>
<span><span class='nv'>body_string</span> <span class='o'>&lt;-</span> <span class='nf'>stringify</span><span class='o'>(</span><span class='nv'>body</span><span class='o'>)</span></span>
<span></span></code></pre>

</div>

------------------------------------------------------------------------

#### :sleeping_face: Comentarios en la cabecera

En RStudio IDE o Positron. En cualquier caso, es bueno para indicar la estructura de alto nivel dentro de un script.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'># Header level 1 ----</span></span>
<span><span class='nv'>more</span></span>
<span><span class='nv'>code</span></span>
<span></span>
<span><span class='c'>## Header level 2 ----</span></span>
<span><span class='nv'>more</span></span>
<span><span class='nv'>code</span></span></code></pre>

</div>

------------------------------------------------------------------------

### :sleeping_face: Estética del código

*:toolbox: Abre uno o varios scripts, ¿puedes mejorar la estética? ¿Usar [Air](https://posit-dev.github.io/air/) en todo el paquete?*

------------------------------------------------------------------------

### :sleeping_face: Menos comentarios / código autoexplicativo

Los comentarios son como pequeñas alertas. ¡No generes fatiga!

Los comentarios que repiten el código quedan desfasados.

------------------------------------------------------------------------

### :sleeping_face: Menos comentarios / código autoexplicativo

``` r
# use only non empty strings
if (!is.na(x) && nzchar(x)) {
  use_string(x)
}
```

------------------------------------------------------------------------

### :sleeping_face: Menos comentarios / código autoexplicativo

``` r
is_non_empty_string <- function(x) {
  !is.na(x) && nzchar(x)
}

if (is_non_empty_string(x)) {
  use_string(x)
}
```

------------------------------------------------------------------------

### :sleeping_face: Menos comentarios / código autoexplicativo

Más información: <https://blog.r-hub.io/2023/01/26/code-comments-self-explaining-code/>

*:toolbox: ¿Existen posibilidades de hacer menos comentarios (¡o más comentarios!) en algunos de tus guiones?*

------------------------------------------------------------------------

## Código :microphone: `stop()` :microphone:

-   "Early return".
-   Estética del código.
-   Menos comentarios/código autoexplicativo.

------------------------------------------------------------------------

## Código :microphone: `stop()` :microphone:

-   "Early return".
-   Estética del código.
-   Menos comentarios/código autoexplicativo.

Por favor, publica en el chat

-   ¡Algo que te haya parecido interesante!
-   ¡Algo con lo que no estabas de acuerdo!
-   ¿Una experiencia buena/mala reciente con estas herramientas?

------------------------------------------------------------------------

## Código de tests

------------------------------------------------------------------------

### HUMEDO / SECO

"DAMP (descriptive and meaningful phrases)"

"DRY (don't repeat yourself)"

¡Un intercambio!

------------------------------------------------------------------------

### Código de tests: diferente de otro código

El código está cubierto por el código de tests, ¡así que podemos asumir más riesgos!

------------------------------------------------------------------------

### Tests ideales

-   Autónomas.

-   Se pueden ejecutar de forma interactiva. [`testthat::test_path()`](https://testthat.r-lib.org/reference/test_path.html).

-   Sin "fugas". {withr}. [`withr::local_options()`](https://withr.r-lib.org/reference/with_options.html), [`withr::local_tempdir()`](https://withr.r-lib.org/reference/with_tempfile.html)...

------------------------------------------------------------------------

### Ejemplo: {swamp}

Exploremos <https://github.com/maelle/swamp>

*:toolbox: ¿Algunas de tus tests tienen código de nivel superior? ¿Puedes crear archivos y funciones de ayuda, y repetir la creación de objetos en cada prueba?*

------------------------------------------------------------------------

### Mocking

Mi código

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span></span>
<span><span class='nv'>is_internet_down</span> <span class='o'>&lt;-</span> <span class='kr'>function</span><span class='o'>(</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='o'>!</span><span class='nf'>curl</span><span class='nf'>::</span><span class='nf'><a href='https://jeroen.r-universe.dev/curl/reference/nslookup.html'>has_internet</a></span><span class='o'>(</span><span class='o'>)</span></span>
<span><span class='o'>&#125;</span></span>
<span></span>
<span><span class='nv'>my_complicated_code</span> <span class='o'>&lt;-</span> <span class='kr'>function</span><span class='o'>(</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='kr'>if</span> <span class='o'>(</span><span class='nf'>is_internet_down</span><span class='o'>(</span><span class='o'>)</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>    <span class='nf'><a href='https://rdrr.io/r/base/message.html'>message</a></span><span class='o'>(</span><span class='s'>"No internet! Le sigh"</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span></span>
<span>  <span class='c'># blablablabla</span></span>
<span><span class='o'>&#125;</span></span></code></pre>

</div>

¿Cómo comprobar el mensaje?

------------------------------------------------------------------------

### Mocking

En el test,

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span></span>
<span><span class='nf'>test_that</span><span class='o'>(</span><span class='s'>"my_complicated_code() notes the absence of internet"</span>, <span class='o'>&#123;</span></span>
<span>  <span class='nf'>local_mocked_bindings</span><span class='o'>(</span>is_internet_down <span class='o'>=</span> <span class='kr'>function</span><span class='o'>(</span><span class='nv'>...</span><span class='o'>)</span> <span class='kc'>TRUE</span><span class='o'>)</span></span>
<span>  <span class='nf'>expect_message</span><span class='o'>(</span><span class='nf'>my_complicated_code</span><span class='o'>(</span><span class='o'>)</span>, <span class='s'>"No internet"</span><span class='o'>)</span></span>
<span><span class='o'>&#125;</span><span class='o'>)</span></span>
<span></span></code></pre>

</div>

------------------------------------------------------------------------

### Mocking

Para leer más: <https://www.tidyverse.org/blog/2023/10/testthat-3-2-0/#mocking>

y <https://testthat.r-lib.org/dev/articles/challenging-tests.html>

------------------------------------------------------------------------

### Mocking

*:toolbox: ¿tienes una situación de este tipo para probar?*

------------------------------------------------------------------------

## Tests :microphone: `stop()` :microphone:

-   DAMP/DRY
-   Código de prueba diferente de código
-   Pruebas ideales (autónomas, pueden ejecutarse interactivamente, sin fugas)
-   Mocking

------------------------------------------------------------------------

## Tests :microphone: `stop()` :microphone:

-   DAMP/DRY
-   Código de prueba diferente de código
-   Pruebas ideales (autónomas, pueden ejecutarse interactivamente, sin fugas)
-   Mocking

Por favor, publica en el chat

-   ¡Algo que te haya parecido interesante!
-   ¡Algo con lo que no estabas de acuerdo!
-   ¿Una experiencia buena/mala reciente con estas herramientas?

------------------------------------------------------------------------

## Elige tu propia aventura

...¡con tu propio paquete! En salas de Zoom.

Nos reuniremos en XX minutos como grupo para debatir.

------------------------------------------------------------------------

## De vuelta de la aventura

¿Comentarios? ¿Preguntas?

------------------------------------------------------------------------

## Muchas gracias.

Nos vemos en el `#package-maintenance` canal? :wink:

