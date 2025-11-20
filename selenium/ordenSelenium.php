<?php 
use Facebook\WebDriver\Remote\DesiredCapabilities;
use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\WebDriverBy; // Necesitas esta clase para localizar elementos
use Facebook\WebDriver\WebDriverExpectedCondition;
use GuzzleHttp\Psr7\Message;
class OrdenSelenium extends ComunSelenium{
    
    public function __construct(ApiController $testLink){
        parent::__construct();
        $this->testLink = $testLink;
    }
    

    public function testOrden(){

        $this->openSystemDSG(true);
        $this->testCrearOrden();        
        sleep(5);
        $this->closeBrowser();


    }
    public function testCrearOrden(){
        $this->createSteps();
        $this->startContador();
        try {
            $this->print("Crear de orden",5);
            echo "\n===============================================\n";
            $this->goTo("order");
            $this->scrollTo('button[type="button"].btnOrder');
            $this->click('button[type="button"].btnOrder');
            $this->waitElement('#domicile_and_takeaway',mensaje:'No se encuentra el modal de domicilio');
            $con = $this;
            $addProduct = function ($nombre, $cantidad) use ($con) {
                $con->scrollTo('div[data-id][nombre="'.$nombre.'"]]');
                $elemeto = $con->driver->findElement($con->selector('div[data-id][nombre="'.$nombre.'"]'));
                $elemeto->findElement($con->selector('button.plusTrigger'))->click();
                $con->click('button.plusTrigger');
                // $con->click('button[type="button"].btnOrder');
                // $con->waitElement('#domicile_and_takeaway',mensaje:'No se encuentra el modal de domicilio');
                // $con->fillSelectBurger('#input-rawmaterial', 1);
            };
            //$this->waitElement('button[type="button"].btnOrder', 5, 500, 'No se encuentra el boton de ordenes');
            
            $this->endContador();
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

}

?>