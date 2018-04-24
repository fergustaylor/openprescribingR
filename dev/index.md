
<script>
function myFunction() {
var frames = document.getElementsByTagName("iframe");
for (i = 0; i < frames.length; i++) {
      frames[i].style.height=frames[i].contentDocument.body.scrollHeight +'px';
  }
}
window.addEventListener("load", myFunction);
window.addEventListener("resize", myFunction);
</script>

<style>
iframe {
 width:100%;
}
</style>

CCGs plotted as geom_polygon_interactive with CCG names as tooltips

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot1.html">
</iframe>

CCGs with prescribing centres overlaid as points

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot2.html">
</iframe>

CCGs with fill colour scaled according to cost per person on 'BNF Section 7.4.5' Drugs, May 2017

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot5.html">
</iframe>

Prescribing centres plotted as points, used to generate voronoi polygons plotted as geom_polygon_interactive, with prescribing centre names as tooltips

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot6.html">
</iframe>

Prescribing centres in NHS West Kent CCG plotted as points, used to generate voronoi polygons within the CCG.

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot7.5.html">
</iframe>

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot8.5.html">
</iframe>

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot10.html">
</iframe>

I did also make a voronoi plot using the centre of each CCG, just to see what it would look like. But It's probably not an appropriate way to visualise CCG data, bearing in mind the difficulties of using voronoi plots. For example, each of the CCGs around Hull. [See the map.](https://fergustaylor.github.io/openprescribingR/dev/plot11compared.html)

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot12.html">
</iframe>

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot12.5.html">
</iframe>

<iframe src="https://fergustaylor.github.io/openprescribingR/dev/plot12.5.5.html">
</iframe>