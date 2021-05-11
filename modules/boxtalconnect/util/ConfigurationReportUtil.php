<?php
/**
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
 * @copyright 2007-2021 PrestaShop SA / 2018-2021 Boxtal
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

/**
 * Contains code for configuration util class.
 */

namespace Boxtal\BoxtalConnectPrestashop\Util;

use BoxtalConnect;

/**
 * Configuration report util class.
 *
 * Helper to generate a full configuration report.
 */
class ConfigurationReportUtil
{

    public static function getConfigurationReport()
    {
        $report = array();

        $report['boxtal_config']    = self::getAllShopBoxtalConfiguration();
        $report['carriers']         = self::getCarriers();
        $report['shipment_states']  = self::getAllShipmentStatuses();
        $report['modules']          = self::getActiveModules();
        $report['zones']            = self::getZones();
        $report['versions']         = self::getVersions();
        $report['php_extensions']   = self::getPhpExtensions();
        $report['registered_hooks'] = self::getRegisteredHooks();
        $report['groups']           = self::getGroups();

        return $report;
    }

    private static function getAllShopBoxtalConfiguration()
    {
        $shops = \Shop::getShopsCollection();
        $configs = array();

        foreach ($shops as $shop) {
            $configs[] = array(
                'shop' => $shop->name,
                'configs' => ConfigurationUtil::getAll(null, $shop->id)
            );
        }

        return $configs;
    }

    private static function getAllShipmentStatuses()
    {
        $statuses = OrderUtil::getOrderStatuses(BoxtalConnect::getInstance()->getContext()->language->id);
        $statuses_by_id = array();

        foreach ($statuses as $status) {
            $statuses_by_id[$status['id_order_state']] = $status['name'];
        }

        return $statuses_by_id;
    }

    private static function getVersions()
    {
        $versions = array();

        $versions['php'] = phpversion();
        $versions['prestashop'] = defined('_PS_VERSION_') ? _PS_VERSION_ : null;
        $versions['boxtal-connect'] = BoxtalConnect::getInstance()->version;

        return $versions;
    }

    private static function getPhpExtensions()
    {
        $extensions = get_loaded_extensions();
        sort($extensions);
        return $extensions;
    }

    private static function getActiveModules()
    {
        $modules = \Module::getModulesInstalled();
        $modules_by_name = array();

        foreach ($modules as $module) {
            $modules_by_name[$module['name']] = $module['version'];
        }
        ksort($modules_by_name);

        return $modules_by_name;
    }

    private static function getZones()
    {
        $zones            = \Zone::getZones();
        $active_countries = \Country::getCountries(BoxtalConnect::getInstance()->getContext()->language->id, true);
        $result           = array();

        foreach ($zones as $zone) {
            $zone_countries = array();

            foreach ($active_countries as $country) {
                if ($country['id_zone'] === $zone['id_zone']) {
                    $zone_countries[$country['iso_code']] = $country['country'];
                }
            }
            ksort($zone_countries);

            $result[] = array(
                'name'      => $zone['name'],
                'active'    => (bool)$zone['active'],
                'countries' => $zone_countries
            );
        }

        return $result;
    }

    private static function getCarrierRange($carrier)
    {
        $zones = \Zone::getZones();
        $range_table = $carrier->getRangeTable();
        $ranges = null;
        $result = null;

        if ($range_table === 'range_weight') {
            $ranges = \RangeWeight::getRanges($carrier->id);
        } elseif ($range_table === 'range_price') {
            $ranges = \RangePrice::getRanges($carrier->id);
        }

        if ($ranges) {
            $result = array();
            foreach ($ranges as $key => $range) {
                if ($range_table === 'range_weight') {
                    $range = array(
                        'min_weight' => $range['delimiter1'],
                        'max_weight' => $range['delimiter2'],
                        'prices'    => array()
                    );

                    foreach ($zones as $zone) {
                        $price = $carrier->getDeliveryPriceByWeight($range['min_weight'], $zone['id_zone']);
                        if ($price !== false) {
                            $range['prices'][] = array(
                                'zone'  => $zone['name'],
                                'price' => $price
                            );
                        }
                    }

                    $result[$key] = $range;
                } else {
                    $range = array(
                        'min_price' => $range['delimiter1'],
                        'max_price' => $range['delimiter2'],
                        'prices'    => array()
                    );

                    foreach ($zones as $zone) {
                        $price = $carrier->getDeliveryPriceByPrice($range['min_price'], $zone['id_zone']);
                        if ($price !== false) {
                            $range['prices'][] = array(
                                'zone'  => $zone['name'],
                                'price' => $price
                            );
                        }
                    }

                    $result[$key] = $range;
                }
            }
        }

        return $result;
    }

    private static function getShippingPreferences()
    {
        $shops = \Shop::getShopsCollection();
        $all_configs = array();

        foreach ($shops as $shop) {
            $shop_group = $shop->id_shop_group;
            $shop_id = $shop->id;
            $all_configs[] = array(
                'shop' => $shop->name,
                'configs' => array(
                    'PS_SHIPPING_HANDLING' =>
                        \Configuration::get('PS_SHIPPING_HANDLING', null, $shop_group, $shop_id),
                    'PS_SHIPPING_FREE_WEIGHT' =>
                        \Configuration::get('PS_SHIPPING_FREE_WEIGHT', null, $shop_group, $shop_id),
                    'PS_SHIPPING_FREE_PRICE' =>
                        \Configuration::get('PS_SHIPPING_FREE_PRICE', null, $shop_group, $shop_id)
                )
            );
        }

        return $all_configs;
    }
    
    private static function getCarrierGroups($carrier)
    {
        $groups = $carrier->getGroups();
        $result = array();

        foreach ($groups as $group) {
            $result[] = $group['id_group'];
        }

        return $result;
    }

    private static function getCarriers()
    {
        $result = array(
            'preferences' => self::getShippingPreferences(),
            'list' => array()
        );
        $carriers = \Carrier::getCarriers(BoxtalConnect::getInstance()->getContext()->language->id);

        foreach ($carriers as $c) {
            $carrier = new \Carrier($c['id_carrier']);
            $tax = new \Tax($carrier->getIdTaxRulesGroup());

            $result['list'][] = array(
                'id'                    => $carrier->id,
                'name'                  => $carrier->name,
                'delay'                 => $carrier->delay,
                'active'                => $carrier->active,
                'tracking_url'          => $carrier->url,
                'free_shipping'         => (bool)$carrier->is_free,
                'handling_cost'         => (bool)$carrier->shipping_handling,
                'max_width'             => $carrier->max_width,
                'max_height'            => $carrier->max_height,
                'max_depth'             => $carrier->max_depth,
                'max_weight'            => $carrier->max_weight,
                'tax_rate'              => $tax->rate,
                'out_of_range_behavior' => $carrier->range_behavior ? 'disable' : 'highest_range',
                'ranges'                => self::getCarrierRange($carrier),
                'groups'                => self::getCarrierGroups($carrier),
                'networks'              => ShippingMethodUtil::getSelectedParcelPointNetworks($carrier->id)
            );
        }
        return $result;
    }

    private static function getRegisteredHooks()
    {
        $module = BoxtalConnect::getInstance();
        $hooks  = \Hook::getHooks();
        $result = array();

        foreach ($hooks as $hook) {
            $name = $hook['name'];
            
            if ($module->isRegisteredInHook($name)) {
                $result[] = $name;
            }
        }

        return $result;
    }

    private static function getGroups()
    {
        $shops = \Shop::getShopsCollection();
        $result = array();

        foreach ($shops as $shop) {
            $groups = \Group::getGroups(BoxtalConnect::getInstance()->getContext()->language->id, $shop->id);

            $result[] = array(
                'shop'    => $shop->name,
                'groups'  => $groups
            );
        }

        return $result;
    }
}
