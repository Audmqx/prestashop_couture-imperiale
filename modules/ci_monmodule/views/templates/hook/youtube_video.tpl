{* {url entity = 'catégorie' id = 3 id_lang = 2}
{url entity = 'catégorie' id = $ id_category id_lang = $ id_lang} *}

{* <a href="">{url entity = 'catégorie' id = 3 id_lang = 2}</a> *}

{* {assign var='all_categories' value=Category::getCategories(Context::getContext()->language->id)}


<h1>{$urls.base_url}</h1>
<a href="{$urls.base_url}">LINK UN</a>

<h1>{$page.page_name}</h1> *}
{* <pre>{$urls|@var_dump}</pre>
<a href="{$link->getProductLink(1)}">LINK DEUX</a>
<a href="{$link->getCategoryLink(5)}">LINK TROIS </a>
<h1>{$urls.pages.category}</h1>
<h1>{$urls.contact}</h1> *}
{* <h1>{url entity = 'contact'} URL ENTITY</h1>
<h1>{url entity = 'category' id = 1 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 2 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 3 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 4 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 5 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 6 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 7 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 8 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 9 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 10 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 11 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 12 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 13 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 14 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 15 id_lang = 1}</h1>
<h1>{url entity = 'category' id = 16 id_lang = 1}</h1>
<img src="{url entity='categoryImage' id=1}">
<img src="{url entity='categoryImage' id=2}">
<img src="{url entity='categoryImage' id=3}">
<img src="{url entity='categoryImage' id=4}">
<img src="{url entity='categoryImage' id=5}">
<img src="{url entity='categoryImage' id=6}">
<img src="{url entity='categoryImage' id=7}">
<img src="{url entity='categoryImage' id=8}">
<img src="{url entity='categoryImage' id=9}">
<img src="{url entity='categoryImage' id=10}">
<img src="{url entity='categoryImage' id=11}">
<img src="{url entity='categoryImage' id=12}">
<img src="{url entity='categoryImage' id=13}">
<img src="{url entity='categoryImage' id=14}"> *}
{* <h1>{url entity='cms' id=1}</h1>
<h1>{url entity='cms' id=2}</h1>
<h1>{url entity='cms' id=3}</h1>
<h1>{url entity='cms' id=4}</h1>
<h1>{url entity='cms' id=5}</h1>
<h1>{url entity='cms' id=6}</h1>
<h1>{url entity='cms' id=7}</h1>
<h1>{url entity='cms' id=8}</h1>
<h1>{url entity='cms' id=9}</h1>
<h1>{url entity='cms' id=10}</h1>
<h1>{url entity='cms' id=11}</h1>
<p><a href="{url entity='cms' id=3}"> {l s='CGV' d='Shop.Theme.Global'}</a></p> *}

<section id="custom-text">
	<div class="relativ">
		<h1 class="hero_bigtypo">CLLCTN.<span class="hero_bigtypo_span">20/21</span></h1>
		<div class="hero_text_wrapper">
			<p>{$youtube_url}</p>
			<div class="a_underline">
				<a href="{url entity='cms' id=6}">→ lookbook</a>
				<div class="underline"></div>
			</div>
		</div>
	</div>

    <img src="{$urls.img_url}hero.jpg" alt="{l s='Mannequin portant des habits de créateur' d='shop.Theme.Yourtheme'}" />
</section>