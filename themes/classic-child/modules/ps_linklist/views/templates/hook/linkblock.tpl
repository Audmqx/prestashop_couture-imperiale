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


<div class="display-flex-column w-100">
  <div class="display-flex-row footer-mobile">
    <div class="footer_container_img">
      <img src="{$urls.img_url}footer-bg.png" alt="{l s='Mannequin portant des habits de créateur' d='shop.Theme.Yourtheme'}"/>
      <img class="footer_img_element" src="{$urls.img_url}footer-el.png" alt="{l s='Mannequin portant des habits de créateur' d='shop.Theme.Yourtheme'}"/>
    </div>


    <div class="col-md-6 links mobile-links">
      <div class="row">
      {foreach $linkBlocks as $linkBlock}
        {if $linkBlock.title == "Notre société"}
            <div class="col-md-6 wrapper">
          <ul id="footer_sub_menu_{$_expand_id}" >
            {foreach $linkBlock.links as $link}
              <li>
                <a
                    id="{$link.id}-{$linkBlock.id}"
                    class="{$link.class}"
                    href="{$link.url}"
                    title="{$link.description}"
                    {if !empty($link.target)} target="{$link.target}" {/if}
                >
                  {$link.title}
                </a>
              </li>
            {/foreach}
          </ul>
        </div>
        {/if}
      {/foreach}
      </div>
    </div>
  </div>



  <div> <p class="footer_bigtypo">HandMade in Nice</p></div>
</div>

