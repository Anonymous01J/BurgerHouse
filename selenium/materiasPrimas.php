<?php 
use Facebook\WebDriver\Remote\DesiredCapabilities;
use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\WebDriverBy; // Necesitas esta clase para localizar elementos
use Facebook\WebDriver\WebDriverExpectedCondition;
use GuzzleHttp\Psr7\Message;
class MateriasPrimasSelenium extends ComunSelenium{
    
    public function __construct(ApiController $testLink){
        parent::__construct();
        $this->testLink = $testLink;
    }
    

    public function testMateriasPrimas(){

        $this->openSystemDSG(true);
        $this->entradasMateriasPrimas();
        $this->entradasMateriasPrimasEditar();
        $this->entradasMateriasPrimasEliminar();
        
        sleep(4);
        $this->closeBrowser();


    }

    public function entradasMateriasPrimas(){
        $this->startContador();
        $this->createSteps();
        $this->print("Crear de entradas de materias primas",5);
        echo "\n===============================================\n";
        try {
            $this->goTo("rawmaterial");
            $this->click('#nav-profile-tab');
            $this->print('Entradas de materias primas',8);
            $button = $this->waitElement('div.mb-4 > button[data-bs-toggle="modal"][data-bs-target="#register-entrys"]', 5, 500, 'No se encuentra el botón de entradas');
            $this->print("click al boton de entradas",4);
            $this->scrollTo('div.mb-4 > button[data-bs-toggle="modal"][data-bs-target="#register-entrys"]');
            $button->click();
            $this->waitElement('#register-entrys', 5, 500, 'No se encuentra el modal de entradas');
            $this->fillSelectBurger('#input-supplier-entrys-1', 1);
            $this->fillSelectBurger('#input-rawmaterial-entrys-1', 1);
            $this->fillSelectBurger('#input-mp-entrys-1', 1);
            $this->fillForms([
                ['selector' => '#input-code-entrys-1', 'value' => '10'],
                ['selector' => '#input-quantity-entrys-1', 'value' => '25'],
                ['selector' => '#input-date-entrys-1', 'value' => date('d-m-Y', strtotime('+1 month'))],
                ['selector' => '#input-price-entrys-1', 'value' => '25000'],
                ['selector' => '#input-ref-entrys-1', 'value' => '0000001'],
                ['selector' => '#input-image-entrys-1', 'value' => getcwd().'/src/media/test/money.jpg'],
            ]);
            $this->click("label[for='submit-entrys']");
            $this->waitAlert(mensaje:'No se muestra el mensaje de exito');
            $this->endContador();

        } catch (\Throwable $th) {
            $this->blockSteps(1); // AGREGAR EL NUMERO DE PASOS
        }
        //AGREGAR REPORTE TESTLINK
    }

    public function entradasMateriasPrimasEditar(){
        $this->startContador();
        $this->createSteps();
        $this->print("Editar de entradas de materias primas",5);
        echo "\n===============================================\n";
        try {
            $this->goTo("rawmaterial");
            $this->click('#nav-profile-tab');
            $this->print('Entradas de materias primas',8);
            $button = $this->waitElement('div.mb-4 > button[data-bs-toggle="modal"][data-bs-target="#register-entrys"]', 5, 500, 'No se encuentra el botón de entradas');
            $this->print("click al boton de entradas",4);
            $this->scrollTo('#DataTables_Table_1');
            $row = $this->findRowInTableByText('#DataTables_Table_1', 'Prueba');
            $row->findElement($this->selector("svg"))->click();
            $aEditar = $row->findElement(WebDriverBy::xpath('.//a[contains(text(), "Editar")]'));
            $aEditar->click();



            $this->waitElement('#edit-entrys', 5, 500, 'No se encuentra el modal de entradas');
            $this->fillSelectBurger('#input-supplier-entryEdit', 2);
            $this->fillSelectBurger('#input-rawmaterial-entryEdit-1', 1);
            
            $this->fillForms([
                ['selector' => '#input-code-entryEdit-1', 'value' => '10000'],
                ['selector' => '#input-quantity-entryEdit-1', 'value' => '2500'],
                ['selector' => '#input-date-entryEdit-1', 'value' => date('d-m-Y', strtotime('+2 month'))],
            ]);
            $this->click("label[for='submit-entrys-edit']");
            $this->waitAlert(mensaje:'No se muestra el mensaje de exito');
            $this->endContador();

        } catch (\Throwable $th) {
            $this->blockSteps(1); // AGREGAR EL NUMERO DE PASOS
        }
        //AGREGAR REPORTE TESTLINK
    }



    public function entradasMateriasPrimasEliminar(){
        $this->startContador();
        $this->createSteps();
        $this->print("Eliminar de entradas de materias primas",5);
        echo "\n===============================================\n";
        try {
            $this->goTo("rawmaterial");
            $this->click('#nav-profile-tab');
            $this->print('Entradas de materias primas',8);
            $button = $this->waitElement('div.mb-4 > button[data-bs-toggle="modal"][data-bs-target="#register-entrys"]', 5, 500, 'No se encuentra el botón de entradas');
            $this->print("click al boton de entradas",4);
            $this->scrollTo('#DataTables_Table_1');
            $row = $this->findRowInTableByText('#DataTables_Table_1', 'Prueba');
            $row->findElement($this->selector("svg"))->click();
            $aEliminar = $row->findElement(WebDriverBy::xpath('.//a[contains(text(), "Eliminar")]'));
            $aEliminar->click();
            $this->waitAlert('swal2-warning',mensaje:'No se muestra el mensaje de exito');
            $this->click("button.swal2-confirm");
            $this->waitAlert(mensaje:'No se muestra el mensaje de exito');
            
            
            $this->endContador();

        } catch (\Throwable $th) {
            $this->blockSteps(1); // AGREGAR EL NUMERO DE PASOS
            $this->print("Error al eliminar la entrada");
            echo "{$th->getMessage()}\n";
        }
        //AGREGAR REPORTE TESTLINK
    }

}

?>