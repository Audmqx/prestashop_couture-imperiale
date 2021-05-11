{**
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    Boxtal <api@boxtal.com>
*
* @copyright 2007-2021 PrestaShop SA / 2018-2021 Boxtal
*
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
<div class="panel">
    <div class="table-responsive-row clearfix">
        {l s='You just have to finalize the settings, we promise it will only take a few minutes!' mod='boxtalconnect'}
        {if null !== $tutoUrl}
            {l s='Need help? Just look into our [1]tutorial[/1]'
                tags=["<a href=\"{$tutoUrl|escape:'htmlall':'UTF-8'}\" target=\"_blank\">"]
                mod='boxtalconnect'}
        {/if}
    </div>
</div>

<div class="panel">
  <div class="panel-heading">
    1. {l s='Delivery area settings' mod='boxtalconnect'}
  </div>
  <div class="row">
    <p>{l s='Firstly, indicate the countries you want to deliver [1]here[/1]'
        tags=["<a href=\"{$zonesSettingsUrl|escape:'htmlall':'UTF-8'}\" target=\"_blank\">"]
        mod='boxtalconnect'}</p>
  </div>
</div>

<div class="panel">
  <div class="panel-heading">
    2. {l s='Delivery methods settings' mod='boxtalconnect'}
  </div>
  <div class="row">
    <p>{l s='When you will create your delivery methods [1]here[/1], please copy paste [2]%s[/2] in the “Tracking URL” field so that the tracking of the order goes up automatically in your Prestashop back office'
        tags=["<a href=\"{$carriersUrl|escape:'htmlall':'UTF-8'}\" target=\"_blank\">", "<b>"]
        sprintf=[$trackingUrlPattern|escape:'htmlall':'UTF-8']
        mod='boxtalconnect'}</p>
  </div>
</div>

<div class="panel">
  <form method="POST">
  <style>
	@media (max-width: 992px) {
        .table-responsive-row td:nth-of-type(1):before {
            content: "{l s='ID' mod='boxtalconnect'}";
        }
        .table-responsive-row td:nth-of-type(2):before {
            content: "{l s='Name' mod='boxtalconnect'}";
        }
        .table-responsive-row td:nth-of-type(3):before {
            content: "{l s='Logo' mod='boxtalconnect'}";
        }
        .table-responsive-row td:nth-of-type(4):before {
            content: "{l s='Parcel points' mod='boxtalconnect'}";
        }
    }
	</style>
    <div class="panel-heading">
      3. {l s='Choice of parcel point\'s maps to show to your customers' mod='boxtalconnect'}
    </div>
    <div class="table-responsive-row clearfix">
      <p>{l s='If you want your customers to be able to choose their relay point in the checkout, select the networks below to display for each delivery method previously created' mod='boxtalconnect'}</p>
      <table class="table">
        <thead>
        <th>{l s='ID' mod='boxtalconnect'}</th>
        <th>{l s='Name' mod='boxtalconnect'}</th>
        <th>{l s='Logo' mod='boxtalconnect'}</th>
        <th>{l s='Parcel point' mod='boxtalconnect'}</th>
        </thead>
        <tbody>
        {foreach from=$carriers key=c item=carrier}
          <tr>
            <td>{$carrier.id_carrier|escape:'htmlall':'UTF-8'}</td>
            <td>{$carrier.name|escape:'htmlall':'UTF-8'}</td>
            <td>
                {if isset($carrier.logo)}
                <img class="imgm img-thumbnail carrier-logo" src="{$carrier.logo|escape:'htmlall':'UTF-8'}">
                {else}
                /
                {/if}
            </td>
            <td>
                <div class="parcelpoint-checkboxes">
                {foreach from=$parcelPointNetworks key=k item=network}
                    <p>
                        <label>
                        <input type="checkbox" name="parcelPointNetworks_{$carrier.id_carrier|escape:'htmlall':'UTF-8'}[]" value="{$k|escape:'htmlall':'UTF-8'}"
                            {if false !== $carrier.parcel_point_networks && in_array($k, $carrier.parcel_point_networks)}
                                checked
                            {/if}
                            >
                            <span class="parcelpoint-label">{l s='Parcel points map including %s' sprintf=[', '|implode:$network] mod='boxtalconnect'}</span>
                        </label>
                    </p>
                {/foreach}
                </div>
            </td>
            <td style="display: none;"></td>
          </tr>
        {/foreach}
        </tbody>
      </table>
    </div>
    <div class="panel-footer">
      <button type="submit" class="btn btn-default pull-right" name="submitParcelPointNetworks">
        <i class="process-icon-save"></i>{l s='Save' mod='boxtalconnect'}
      </button>
    </div>
  </form>
</div>

<div class="panel status">
  <form method="POST" class="form-horizontal">
    <div class="panel-heading">
      4. {l s='Order statuses settings' mod='boxtalconnect'}
    </div>
    <div class="form-group">
        <label class="control-label col-lg-7">
            {l s='[1]When the shipping label is generated[/1], then change its status to' tags=['<b>'] mod='boxtalconnect'}
        </label>
        <div class="col-lg-4 col-rg-offset-1">
            <select class="form-control" name="orderPrepared">
                <option value="" {if null === $orderPrepared}selected{/if}>{l s='No status associated' mod='boxtalconnect'}</option>
                {foreach from=$orderStatuses key=k item=status}
                <option value="{$status.id_order_state|escape:'htmlall':'UTF-8'}" {if $status.id_order_state === $orderPrepared}selected{/if}>{$status.name|escape:'htmlall':'UTF-8'}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-7">
            {l s='[1]When the shipping is picked up by the carrier[/1], then change its status to' tags=['<b>'] mod='boxtalconnect'}
        </label>
        <div class="col-lg-4 col-rg-offset-1">
            <select class="form-control" name="orderShipped">
                <option value="" {if null === $orderShipped}selected{/if}>{l s='No status associated' mod='boxtalconnect'}</option>
                {foreach from=$orderStatuses key=k item=status}
                <option value="{$status.id_order_state|escape:'htmlall':'UTF-8'}" {if $status.id_order_state === $orderShipped}selected{/if}>{$status.name|escape:'htmlall':'UTF-8'}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-7">
            {l s='[1]When the shipping is delivered by the carrier[/1], then change its status to' tags=['<b>'] mod='boxtalconnect'}
        </label>
        <div class="col-lg-4 col-rg-offset-1">
            <select class="form-control" name="orderDelivered">
                <option value="" {if null === $orderDelivered}selected{/if}>{l s='No status associated' mod='boxtalconnect'}</option>
                {foreach from=$orderStatuses key=k item=status}
                <option value="{$status.id_order_state|escape:'htmlall':'UTF-8'}" {if $status.id_order_state === $orderDelivered}selected{/if}>{$status.name|escape:'htmlall':'UTF-8'}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="panel-footer">
      <button type="submit" class="btn btn-default pull-right" name="submitTrackingEvents">
        <i class="process-icon-save"></i>{l s='Save' mod='boxtalconnect'}
      </button>
    </div>
  </form>
</div>

{if null !== $shippingRulesUrl}
<div class="panel">
    <div class="panel-heading">
      5. {l s='Shipping rules settings' mod='boxtalconnect'}
    </div>
    <p class="table-responsive-row clearfix">
        {l s='Wish to save some time? Use our shipping rules, they are free to use!' mod='boxtalconnect'}
    </p>
    <p class="table-responsive-row clearfix">
        {l s='They enable you to automatize the selection of a carrier offer, the subscription to our AXA insurance and stop importing the orders that are not to be processed through Boxtal (e.g. If the shipping method is "Store pickup")' mod='boxtalconnect'}
    </p>
    <div class="panel-footer">
      <a href="{$shippingRulesUrl|escape:'htmlall':'UTF-8'}" target="_blank" class="btn btn-primary pull-right">
        {l s='Set up shipping rules' mod='boxtalconnect'}
      </a>
    </div>
</div>
{/if}
