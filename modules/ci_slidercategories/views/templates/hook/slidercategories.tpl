<section class="slider_main">
	<div class="slider_text_wrapper">
		<h2>Parcourir nos catégories</h2>
		<p>Mélangez différents vêtements pour créer une combinaison unique de couleurs et de formes.</p>
		<img class="slider_wrapper_logo" src="{$urls.img_url}logo-cercle-CI.svg">
		<div class="a_underline">
				<a href="{url entity='category' id=3}">→ Voir tout</a>
				<div class="underline"></div>
		</div>
	</div>

    <div class="splide">
	<div class="splide__track" id="splide__track">
		<ul class="splide__list">
			<li class="splide__slide"><img src="{url entity='categoryImage' id=10}" alt="{l s='Catégorie hauts' d='shop.Theme.Yourtheme'}" />
    		<a href="{url entity = 'category' id = 10 id_lang = 1}"><p>Hauts</p> Voir plus</a></li>

			<li class="splide__slide"><img src="{url entity='categoryImage' id=11}" alt="{l s='Catégorie pantalons' d='shop.Theme.Yourtheme'}" />
    		<a href="{url entity = 'category' id = 11 id_lang = 1}"><p>Pantalons</p> Voir plus</a></li>

			<li class="splide__slide"><img src="{url entity='categoryImage' id=12}" alt="{l s='Catégorie manteaux et vestes' d='shop.Theme.Yourtheme'}" />
    		<a href="{url entity = 'category' id = 12 id_lang = 1}"><p>Manteaux et vestes</p> Voir plus</a></li>

			<li class="splide__slide"><img src="{url entity='categoryImage' id=13}" alt="{l s='Catégorie robes' d='shop.Theme.Yourtheme'}" />
    		<a href="{url entity = 'category' id = 13 id_lang = 1}"><p>Robes</p> Voir plus</a></li>

			<li class="splide__slide"><img src="{url entity='categoryImage' id=14}" alt="{l s='Catégorie shorts' d='shop.Theme.Yourtheme'}" />
    		<a href="{url entity = 'category' id = 14 id_lang = 1}"><p>Shorts</p> Voir plus</a></li>

    		<li class="splide__slide"><img src="{url entity='categoryImage' id=6}" alt="{l s='Catégorie accessoires' d='shop.Theme.Yourtheme'}" />
			<p>Accessoires</p>
    		<a href="{url entity = 'category' id = 6 id_lang = 1}">Voir plus</a></li>
		</ul>
	</div>
	</div>

	<div class="slider_background"></div>
	<img class="slider_background_element" src="{$urls.img_url}Soustraction.png">
</section>
