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
        // $this->closeBrowser();


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
            $this->print("Click al boton de orden",4);
            $modal = $this->waitElement('#domicile_and_takeaway',mensaje:'No se encuentra el modal de domicilio');
            $con = $this;
            // funcion para agregar productos
            $addProduct = function ($dataId, $cantidad) use ($con, $modal) {
                //$con->scrollTo($con->selector('div[dataId="Pizza Max"]]'));
                sleep(1);
                $elemeto = $modal->findElement($con->selector('div[data-id="'.$dataId.'"]'));
                $con->driver->executeScript("arguments[0].scrollIntoView({behavior: 'instant', block: 'center', inline: 'nearest'});", [$elemeto]);
                $plusTrigger = $elemeto->findElement($con->selector('button.plusTrigger'));
                $con->driver->executeScript("arguments[0].click();", [$plusTrigger]);
                $plusBtn = $elemeto->findElement($con->selector('button.plusBtn'));
                for($i = 0; $i < $cantidad - 1; $i++){
                    $con->driver->executeScript("arguments[0].click();", [$plusBtn]);
                }
            };

            // $addProduct('Pizza Max', 4);
            $addProduct('54', 3);
            $this->print("Agregar productos",4);
            $this->scrollTo($this->selector('.select_product_btn_next'));
            $modal->findElement($this->selector('.select_product_btn_next'))->click();
            $this->print("Click al boton de siguiente",4);
            $this->waitElement("h4.subtotal");
            sleep(1);
            $modal->findElement($this->selector('button[onclick="stepper.next()"'))->click();

            $this->print("Click al boton de siguiente",4);

            $modal->findElement($this->selector('#form-search-client-order input[type="search"]'))->sendKeys("30218990");
            $modal->findElement($this->selector('#form-search-client-order button[type="submit"]'))->click();
            

            $this->waitElement(".target_client_order p.document_client", 10, 500, 'No se encuentra el documento del cliente');
            $this->scrollTo("#input-payment-order-1");
            $this->fillSelectBurger("#input-payment-order-1",1);
            $monto = $modal->findElement($this->selector('.amount_payment_bs'))->getText() ?? "433778";
            $this->fillForms([
                ['selector' => '#input-tel-client-order', 'value' => '4145555555'],
                ['selector' => '#input-quantity-order-1', 'value' => str_replace('.', '', $monto)],
                ['selector' => '#input-reference-order-1', 'value' => '010005'],
                ['selector' => '#input-comprobante-order-1', 'value' => getcwd().'/src/media/test/money.jpg'],
            ]);
            $this->print("llenar formulario",4);
            

            $this->click("button.btn_next_payment");
            $this->fillForm(".form-control.direction_sale", "Avenida siempre viva 123");
            $this->click("button.confirm_order");
            //$this->waitElement('button[type="button"].btnOrder', 5, 500, 'No se encuentra el boton de ordenes');
            
            $this->endContador();
        } catch (\Throwable $th) {
            //throw $th;
            $this->print("Error al crear la orden",3);
            echo "{$th->getMessage()}\n";
            $this->blockSteps(1);
        }
    }

}

?>