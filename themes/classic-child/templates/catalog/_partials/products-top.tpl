{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}


<div id="js-product-list-top" class="row products-selection">

  <div class="col-md-6 total-products">
    {if $listing.pagination.total_items > 1}
      <p>{l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}</p>
    {elseif $listing.pagination.total_items > 0}
      <p>{l s='There is 1 product.' d='Shop.Theme.Catalog'}</p>
    {/if}
  </div>
 

  <div class="col-md-6 total-categories">
    <div class="col-md-9 products-sort-order dropdown">
      <button
        class="btn-unstyle select-title"
        rel="nofollow"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false">
        {if {$urls.current_url} == "{$urls.base_url}3-vetements"}
          ALL
        {elseif {$urls.current_url} == "{$urls.base_url}10-hauts"}
          Hauts
        {elseif {$urls.current_url} == "{$urls.base_url}11-pantalons"}
          Pantalons
        {elseif {$urls.current_url} == "{$urls.base_url}12-manteaux-et-vestes"}
          Manteaux et vestes
        {elseif {$urls.current_url} == "{$urls.base_url}13-robes"}
          Robes
        {elseif {$urls.current_url} == "{$urls.base_url}14-shorts"}
          Shorts
        {elseif {$urls.current_url} == "{$urls.base_url}6-accessoires"}
          Accessoires
        {else}
         Créations par catégorie
        {/if}

        <i class="material-icons float-xs-right">add</i>
      </button>
      <div class="dropdown-menu">  
          <a
            rel="nofollow"
            href="{url entity = 'category' id = 3 id_lang = 1}"
            class="select-list"
          >
            ALL
          </a>
                    <a
            rel="nofollow"
            href="{url entity = 'category' id = 10 id_lang = 1}"
            class="select-list"
          >
            Hauts
          </a>
                    <a
            rel="nofollow"
            href="{url entity = 'category' id = 11 id_lang = 1}"
            class="select-list"
          >
            Pantalons
          </a>
                    <a
            rel="nofollow"
            href="{url entity = 'category' id = 12 id_lang = 1}"
            class="select-list"
          >
            Manteaux et vestes
          </a>
                    <a
            rel="nofollow"
            href="{url entity = 'category' id = 13 id_lang = 1}"
            class="select-list"
          >
            Robes
          </a>
                    <a
            rel="nofollow"
            href="{url entity = 'category' id = 14 id_lang = 1}"
            class="select-list"
          >
            Shorts
          </a>
                              <a
            rel="nofollow"
            href="{url entity = 'category' id = 6 id_lang = 1}"
            class="select-list"
          >
            Accessoires
          </a>
      </div>
    </div>
  </div>

    <div class="row sort-by-row">

      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
      {/block}

{*       {if !empty($listing.rendered_facets)}
        <div class="col-sm-3 col-xs-4 hidden-md-up filter-button">
          <button id="search_filter_toggler" class="btn btn-secondary">
            {l s='Filter' d='Shop.Theme.Actions'}
          </button>
        </div>
      {/if} *}
    </div>
  </div>
{*   <div class="col-sm-12 hidden-md-up text-sm-center showing">
    {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=[
    '%from%' => $listing.pagination.items_shown_from ,
    '%to%' => $listing.pagination.items_shown_to,
    '%total%' => $listing.pagination.total_items
    ]}
  </div> *}