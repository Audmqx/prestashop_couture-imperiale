<?php

if (!defined('_PS_VERSION_'))
    exit();

class Ci_AboutUs extends Module
{
    public function __construct()
    {
        $this->name = 'ci_aboutus';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Audmqx';
        $this->need_instance = 1;
        $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Section : qui sommes-nous');
        $this->description = $this->l('Ce module montre la section qui sommes-nous');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
    }

    public function install()
    {
        if (Shop::isFeatureActive())
            Shop::setContext(Shop::CONTEXT_ALL);

        return parent::install() &&
            $this->registerHook('displayHome') && Configuration::updateValue('ci_aboutus_p1', 'Notre atelier est un espace de création de vêtements qui incarnent le classique et le contemporain.') && Configuration::updateValue('ci_aboutus_p2', 'Nos pièces sont conçues à partir de chutes de tissus de grandes maisons et d’ateliers, ce qui nous permet d’allier qualité des matières et éco-responsabilité.') && Configuration::updateValue('ci_aboutus_p3', 'Chaque pièce est une création à la main fabriquée entre 1 et 3 exemplaires dans notre atelier, à Nice.')&& Configuration::updateValue('ci_aboutus_h2', 'L’atelier Couture Imépriale');
    }

    public function uninstall()
    {
        if (!parent::uninstall() || !Configuration::deleteByName('ci_aboutus_p1') || !Configuration::deleteByName('ci_aboutus_p2') || !Configuration::deleteByName('ci_aboutus_p3') || !Configuration::deleteByName('ci_aboutus_h2'))
            return false;
        return true;
    }

    public function hookDisplayHome($params)
    {
        // < assign variables to template >
        $this->context->smarty->assign(
            array('ci_aboutus_p1' => Configuration::get('ci_aboutus_p1'),
            'ci_aboutus_p2' => Configuration::get('ci_aboutus_p2'),
            'ci_aboutus_p3' => Configuration::get('ci_aboutus_p3'),
            'ci_aboutus_h2' => Configuration::get('ci_aboutus_h2') )
        );
        return $this->display(__FILE__, 'aboutus.tpl');
    }



    public function displayForm()
    {
        // Récupère la langue par défaut
        $defaultLang = (int)Configuration::get('PS_LANG_DEFAULT');
      
        // Initialise les champs du formulaire dans un tableau
        $form = array(
        'form' => array(
            'legend' => array(
                'title' => $this->l('Settings'),
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->l('Titre de la section'),
                    'name' => 'ci_aboutus_h2',
                    'size' => 256,
                    'required' => true
                )
            ,
                array(
                    'type' => 'text',
                    'label' => $this->l('p1 de la section'),
                    'name' => 'ci_aboutus_p1',
                    'size' => 256,
                    'required' => true
                )
            ,
                array(
                    'type' => 'text',
                    'label' => $this->l('p2 de la section'),
                    'name' => 'ci_aboutus_p2',
                    'size' => 256,
                    'required' => true
                )
            ,
                array(
                    'type' => 'text',
                    'label' => $this->l('p3 de la section'),
                    'name' => 'ci_aboutus_p3',
                    'size' => 256,
                    'required' => true
                )
            ),
            'submit' => array(
                'title' => $this->l('Save'),
                'name'  => 'btnSubmit'
            )
        ),
    );
      
        $helper = new HelperForm();
      
        // Module, token et currentIndex
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;
      
        // Langue
        $helper->default_form_language = $defaultLang;
      
        // Charge la valeur de NS_MONMODULE_PAGENAME depuis la base
        $helper->fields_value['ci_aboutus_h2'] = Configuration::get('ci_aboutus_h2');
        $helper->fields_value['ci_aboutus_p1'] = Configuration::get('ci_aboutus_p1');
        $helper->fields_value['ci_aboutus_p2'] = Configuration::get('ci_aboutus_p2');
        $helper->fields_value['ci_aboutus_p3'] = Configuration::get('ci_aboutus_p3');
      
        return $helper->generateForm(array($form));
    }


    public function getContent()
    {
        $output = null;
     
        if (Tools::isSubmit('btnSubmit')) {
            $titre = strval(Tools::getValue('ci_aboutus_h2'));
            $p1 = strval(Tools::getValue('ci_aboutus_p1'));
            $p2 = strval(Tools::getValue('ci_aboutus_p2'));
            $p3 = strval(Tools::getValue('ci_aboutus_p3'));
     
            if (
                !$titre||
                empty($titre)
            ) {
                $output .= $this->displayError($this->l('Invalid Configuration value'));
            } else {
                Configuration::updateValue('ci_aboutus_h2', $titre);
                $output .= $this->displayConfirmation($this->l('Settings updated'));
            }

            if (
                !$p1||
                empty($p1)
            ) {
                $output .= $this->displayError($this->l('Invalid Configuration value'));
            } else {
                Configuration::updateValue('ci_aboutus_p1', $p1);
                $output .= $this->displayConfirmation($this->l('Settings updated'));
            }

            if (
                !$p2||
                empty($p2)
            ) {
                $output .= $this->displayError($this->l('Invalid Configuration value'));
            } else {
                Configuration::updateValue('ci_aboutus_p2', $p2);
                $output .= $this->displayConfirmation($this->l('Settings updated'));
            }

            if (
                !$p3||
                empty($p3)
            ) {
                $output .= $this->displayError($this->l('Invalid Configuration value'));
            } else {
                Configuration::updateValue('ci_aboutus_p3', $p3);
                $output .= $this->displayConfirmation($this->l('Settings updated'));
            }
        }
     
        return $output.$this->displayForm();
    }

}