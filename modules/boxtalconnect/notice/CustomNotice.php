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
 * Contains code for the custom notice class.
 */

namespace Boxtal\BoxtalConnectPrestashop\Notice;

/**
 * Custom notice class.
 *
 * Custom notice where message and status determine display.
 *
 * @class       CustomNotice
 */
class CustomNotice extends AbstractNotice
{
    /**
     * Notice message.
     *
     * @var string
     */
    protected $message;

    /**
     * Notice status.
     *
     * @var string (accepted statuses: 'warning', 'info', 'success')
     */
    protected $status;

    /**
     * Construct function.
     *
     * @param string $key key for notice
     * @param int $shopGroupId shop group id
     * @param int $shopId shop id
     * @param array $args additional args
     *
     * @void
     */
    public function __construct($key, $shopGroupId, $shopId, $args)
    {
        parent::__construct($key, $shopGroupId, $shopId);
        $this->type = 'custom';
        $this->autodestruct = isset($args['autodestruct']) ? $args['autodestruct'] : true;
        $this->status = isset($args['status']) ? $args['status'] : 'info';
        $this->message = isset($args['message']) ? $args['message'] : '';
        $this->template = 'custom';
    }
}
