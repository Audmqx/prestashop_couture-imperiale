<?php

if (!defined('_PS_VERSION_')) { // Permet de récupérer la version de PrestaShop
    exit;
}
 
class Ps_Hero extends Module {

	public function __construct()
	{
	    $this->name = 'ps_hero'; // Doit correspondre au nom du module, dans notre cas : monmodule
	    $this->tab = 'front_office_features'; // Correspond à l'onglet de catégorisation du module, pour tous les connaitre : https://devdocs.prestashop.com/1.7/modules/creation/
	    $this->version = '1.0'; // Version actuelle du module
	    $this->author = 'Audmqx'; // L'auteur
	    $this->ps_versions_compliancy = [ // Permet de limiter les versions compatibles
	        'min' => '1.7',
	        'max' => _PS_VERSION_
	    ];
	    parent::__construct();
	 
	    $this->displayName = $this->l('Hero Section'); // Nom d'affichage
	    $this->description = $this->l('Module qui affiche une grande image/ big typo et link'); // Description du module
	    $this->confirmUninstall = $this->l('Êtes-vous sûr de vouloir désinstaller ce module ?');
	}

	public function install()
	    {
	        if (parent::install()) {
	            return true;
	        }
	 
	        return false;
	    }
	 
	    public function uninstall()
	    {
	        if (parent::uninstall()) {
	            return true;
	        }
	 
	        return false;
	    }

	public function hookDisplayProductPriceBlock() {
	    // EXEMPLE - Faire afficher un texte dans le front
	    return $this->display(__FILE__, 'views/templates/admin/monaffichage.tpl');
	}

}

