<?php

if (!defined('_PS_VERSION_'))
    exit();

class Ci_SliderCategories extends Module
{
    public function __construct()
    {
        $this->name = 'ci_slidercategories';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Audmqx';
        $this->need_instance = 1;
        $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Slider categories');
        $this->description = $this->l('Ce module montre les catégories avec un slider en JavaScript');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
    }

    public function install()
    {
        if (Shop::isFeatureActive())
            Shop::setContext(Shop::CONTEXT_ALL);

        return parent::install() &&
            $this->registerHook('displayHome') && Configuration::updateValue('urlVariable', 'wlsdMpnDBn8');
    }

    public function uninstall()
    {
        if (!parent::uninstall() || !Configuration::deleteByName('urlVariable'))
            return false;
        return true;
    }

    public function hookDisplayHome($params)
    {
        // < assign variables to template >
        $this->context->smarty->assign(
            array('urlVariable' => Configuration::get('urlVariable'))
        );
        return $this->display(__FILE__, 'slidercategories.tpl');
    }

}